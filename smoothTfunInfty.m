function T1=smoothTfunInfty(z)
if z>0
    if z>0.999999
        z=0.999999;
    end
    T1=exp((1-2*z)/z/(z-1));
else
    T1=0;
end
