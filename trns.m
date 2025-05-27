%Transition function
%x: Transition value
%X1: Starting point x
%Y1: Starting point y=0
%X2: End point x
%Y2: End point y=1
%Flag: Transition function type
function [s] = trns(x,x1,x2,flag)
%Parameter check
if x1==x2
    flag = -1;
    error(['Unhandled flag from trns = ',num2str(flag)]);
end

xx = (x-x1)/(x2-x1);
if xx<=0
    s=0;
elseif xx>=1
    s=1;
else
    switch flag
        case 0
            s = 1/(exp((1-2*xx)/(xx*(1-xx)))+1);
        case 1
            s = xx^2*(-2*xx+3);
        case 2
            s = xx^3*(6*xx^2-15*xx+10);
        case 3
            s = 1/2*(1+sin((xx-1/2)*pi));
        otherwise
            error(['Unhandled flag from trns = ',num2str(flag)]);
    end
end
