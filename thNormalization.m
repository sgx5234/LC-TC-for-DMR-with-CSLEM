%角度归一化到[-pi,pi)
%th：输入角度，单位弧度
function thPi=thNormalization(th)
thPi = th-floor((th+pi)/(pi*2))*(pi*2);
