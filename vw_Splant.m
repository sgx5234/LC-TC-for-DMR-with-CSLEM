function [sys,x0,str,ts] = vw_Splant(t,x,u,flag)
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
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
% x0  = [0,0,0,0];%S1
% x0  = [-50,100,50,-100];%S2
x0  = [100,200,100,200];%S3
str = [];
ts  = [0 0];

function sys=mdlDerivatives(t,x,u)
u1=u(1);
u2=u(2);
I=4*10^-4;
c=0.0022;
tauL=0.01*sin(t);
L=2.7;
Kb=0.05;
R=0.4;
NK=0.015;
dw1=I^-1*(-c*x(1)+NK*x(3)-tauL);
dw2=I^-1*(-c*x(2)+NK*x(4)-tauL);
di1=L^-1*(-Kb*x(1)-R*x(3)+u1);
di2=L^-1*(-Kb*x(2)-R*x(4)+u2);
sys(1)=dw1;
sys(2)=dw2;
sys(3)=di1;
sys(4)=di2;

function sys=mdlOutputs(~,x,~)
sys(1) = x(1);
sys(2) = x(2);
