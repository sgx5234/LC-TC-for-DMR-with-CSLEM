function [gamma] = amplifier(z,rho,delta,alpha)
flag = 0;
if abs(z)>=abs(rho)
    flag = -1;
elseif rho<0
    flag = -2;
elseif delta<0
     flag = -3;
elseif delta>1
     flag = -3;
elseif alpha<0
    flag = -4;
end

switch flag
    case 0
        eta = ((z/rho)^2-delta^2)/(1-delta^2);
    otherwise
        error(['Unhandled flag from DirectPPC_amplifier = ',num2str(flag),' ',num2str(z),' ',num2str(rho)]);
end

% gamma = smoothTfunInfty(eta)+1;
if eta<=0
    gamma = 0;
else
    gamma = exp((1-2*eta)/(eta*(eta-1)));
end
gamma = gamma+1;
