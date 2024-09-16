function [sys,x0,str,ts] = vw_Scontroller(t,x,u,flag)
%% Scontroller
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
%% mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 8;
sizes.NumInputs      = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys=mdlOutputs(~,~,u)
t = u(1);
D = [1 1;1 -1];
vd = u(2);
wd = u(3);
v = u(4);
w = u(5);
dw1 = u(6);
dw2 = u(7);

Wd=D*[vd,wd]';
w1=v;
w2=w;
w1d=Wd(1);
w2d=Wd(2);

kj1 = 20;
kj2 = 20;
T = 3;
epsilon_j1 = 3;
epsilon_j2 = 30;

rho_j1 = smoothTfunInfty((T-t)/T)+epsilon_j1;
rho_j2 = smoothTfunInfty((T-t)/T)+epsilon_j2;
z11 = w1-w1d;
z21 = w2-w2d;
delta_the = 0.5;
alpha = 1;
alpha_z11 = -kj1*amplifier(z11,rho_j1,delta_the,alpha)*z11;
alpha_z21 = -kj1*amplifier(z21,rho_j1,delta_the,alpha)*z21;

z12=dw1-alpha_z11;
z22=dw2-alpha_z21;
ur = -kj2*amplifier(z12,rho_j2,delta_the,alpha)*z12;
ul = -kj2*amplifier(z22,rho_j2,delta_the,alpha)*z22;

sys(1) = ur;
sys(2) = ul;
sys(3) = z11;
sys(4) = z21;
sys(5) = z12;
sys(6) = z22;
sys(7) = rho_j1;
sys(8) = rho_j2;
