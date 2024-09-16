function [sys,x0,str,ts] = xyth_Scontroller(t,x,u,flag)
%% Scontroller
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u);
case {1,2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
%% mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 5;
sizes.NumInputs      = 7;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys=mdlOutputs(~,~,u)
t = u(1);
xr = u(2);
yr = u(3);
thr = u(4);
x = u(5);
y = u(6);
th = u(7);
xe = xr-x;
ye = yr-y;
thd = atan2(ye,xe);

if abs(thd-thr)>pi
    thd2 = thr+thNormalization(thd-thr);
else
    thd2 = thd;
end
d = (xe^2+ye^2)^(1/2);
de1 = 0.01;
de2 = 0.02;
trnsType = 2;
trnsd = trns(d,de1,de2,trnsType);
if d<=de1
    ths = thr;
elseif d<de2
    ths = thr+trnsd*(thd2-thr);
    ths = thNormalization(ths);
else
    ths = thd;
end
eths = th-ths;
eths = thNormalization(eths);

kd = 25;
kth = 10;
epsilon_d = 0.1;
epsilon_th = 0.1;
T = 3;
rho_d0 = 1.5;
rho_th0 = 1.5;

rho_d = (rho_d0-epsilon_d)*smoothTfun1((T-t)/T)+epsilon_d;
alpha_d = kd*LowComplexityFun(d,rho_d);
rou_the = (rho_th0-epsilon_th)*smoothTfun1((T-t)/T)+epsilon_th;
alpha_th = -kth*LowComplexityFun(eths,rou_the);

uv = alpha_d;
uw = alpha_th;

sys(1) = uv;
sys(2) = uw;
sys(3) = ths;%thr,ths,thd
sys(4) = rho_d;
sys(5) = rou_the;

