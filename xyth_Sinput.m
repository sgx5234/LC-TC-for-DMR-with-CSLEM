function [sys,x0,str,ts] = xyth_Sinput(t,x,u,flag)
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
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [-0.5,-1,0];
str = [];
ts  = [];

function sys=mdlDerivatives(t,x,~)
if mod(floor(t/1),2)==0
    vr = 1;
    wr = 0;
else
    vr = 0.5;
    wr = pi/2;
end
thr = x(3);
sys(1) = vr*cos(thr);%xr
sys(2) = vr*sin(thr);%yr
sys(3) = wr;%thr

function sys=mdlOutputs(~,x,u)
switch ParameterConfig.TrackType
case 1
    t = u(1);
    r = 1;
    w = 1;
    % v = w*r;
    thc = thNormalization(w*t-pi/2);
    th = thNormalization(thc+pi/2);
    sys(1) = r*cos(thc);
    sys(2) = r*sin(thc);
    sys(3) = th;
case 2
    xr = x(1);
    yr = x(2);
    thr = x(3);
    sys(1) = xr;
    sys(2) = yr;
    sys(3) = thr;
otherwise
    t = u(1);
    r = 1;
    w = 1;
    % v = w*r;
    thc = thNormalization(w*t-pi/2);
    th = thNormalization(thc+pi/2);
    sys(1) = r*cos(thc);
    sys(2) = r*sin(thc);
    sys(3) = th;
end

