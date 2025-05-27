close all;
FontSize = 16;
isDisplayUnit = 0;

%% load data
load('simdata20250526_S1.mat')
S1_all = all; S1_d = d; S1_thd = thd; S1_z11 = z11; S1_z21 = z21; S1_z12 = z12; S1_z22 = z22;
load('simdata20250526_S2.mat')
S2_all = all; S2_d = d; S2_thd = thd; S2_z11 = z11; S2_z21 = z21; S2_z12 = z12; S2_z22 = z22;
load('simdata20250526_S3.mat')
S3_all = all; S3_d = d; S3_thd = thd; S3_z11 = z11; S3_z21 = z21; S3_z12 = z12; S3_z22 = z22;
load('simdata20250526_S4.mat')
S4_all = all; S4_d = d; S4_thd = thd; S4_z11 = z11; S4_z21 = z21; S4_z12 = z12; S4_z22 = z22;

%% x-y
figure('color','white');
hold on
box on
grid on
Pn = S1_all; plot(Pn(:,1),Pn(:,2),'y','LineWidth',2);
Pn = S1_all; plot(Pn(:,4),Pn(:,5),'g--','LineWidth',1.5);
Pn = S2_all; plot(Pn(:,4),Pn(:,5),'c-.','LineWidth',1.5);
Pn = S3_all; plot(Pn(:,4),Pn(:,5),'k:','LineWidth',1.5);
Pn = S4_all; plot(Pn(:,1),Pn(:,2),'m','LineWidth',2);
Pn = S4_all; plot(Pn(:,4),Pn(:,5),'b-.','LineWidth',1.5);
axis([-1.3 1.3 -1.5 1.1]);
if isDisplayUnit==1
    xlabel('$t$(s)','Interpreter','latex','FontSize',FontSize);
    ylabel('$x$(m)','Interpreter','latex','FontSize',FontSize);
else
    xlabel(' ','Interpreter','latex','FontSize',FontSize);
    ylabel(' ','Interpreter','latex','FontSize',FontSize);
end
h=legend('$[x_r,y_r]$ for S1,S2,S3','$[x,y]$ under S1','$[x,y]$ under S2','$[x,y]$ under S3','$[x_r,y_r]$ for S4','$[x,y]$ under S4');
set(gca,'FontName','Helvetica','FontSize',FontSize);
set(h,'Interpreter','latex');

%% d
figure('color','white');
hold on
box on
grid on
Pn = S1_d; plot(Pn.time,Pn.signals.values(:,1),'g--','LineWidth',2);
Pn = S2_d; plot(Pn.time,Pn.signals.values(:,1),'c-.','LineWidth',2);
Pn = S3_d; plot(Pn.time,Pn.signals.values(:,1),'k:','LineWidth',2);
Pn = S4_d; plot(Pn.time,Pn.signals.values(:,1),'b-.','LineWidth',2);
Pn = S1_d; plot(Pn.time,Pn.signals.values(:,2),'r-','LineWidth',2);
Pn = S1_d; plot(Pn.time,Pn.signals.values(:,3),'m-','LineWidth',2);
if isDisplayUnit==1
    xlabel('$t(s)$','Interpreter','latex','FontSize',FontSize);
    ylabel('$d(m)$','Interpreter','latex','FontSize',FontSize);
else
    xlabel(' ','Interpreter','latex','FontSize',FontSize);
    ylabel(' ','Interpreter','latex','FontSize',FontSize);
end
h=legend('$z_d$ under S1','$z_d$ under S2','$z_d$ under S3','$z_d$ under S4','$\rho_d$','$-\rho_d$');
set(gca,'FontName','Helvetica','FontSize',FontSize);
set(h,'Interpreter','latex');

%% thd
figure('color','white');
hold on
box on
grid on
Pn = S1_thd; plot(Pn.time,Pn.signals.values(:,3),'g--','LineWidth',2);
Pn = S2_thd; plot(Pn.time,Pn.signals.values(:,3),'c-.','LineWidth',2);
Pn = S3_thd; plot(Pn.time,Pn.signals.values(:,3),'k:','LineWidth',2);
Pn = S4_thd; plot(Pn.time,Pn.signals.values(:,3),'b-.','LineWidth',2);
Pn = S1_thd; plot(Pn.time,Pn.signals.values(:,4),'r-','LineWidth',2);
Pn = S1_thd; plot(Pn.time,Pn.signals.values(:,5),'m-','LineWidth',2);
if isDisplayUnit==1
    xlabel('$t(s)$','Interpreter','latex','FontSize',FontSize);
    ylabel('$\theta(rad)$','Interpreter','latex','FontSize',FontSize);
else
    xlabel(' ','Interpreter','latex','FontSize',FontSize);
    ylabel(' ','Interpreter','latex','FontSize',FontSize);
end
h=legend('$z_\theta$ under S1','$z_\theta$ under S2','$z_\theta$ under S3','$z_\theta$ under S4','$\rho_\theta$','$-\rho_\theta$');
set(gca,'FontName','Helvetica','FontSize',FontSize);
set(h,'Interpreter','latex');

%% zj1
figure('color','white');
hold on
box on
grid on
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,1),'g--','LineWidth',2);
Pn = S1_z21; plot(Pn.time,Pn.signals.values(:,1),'g-.','LineWidth',2);
Pn = S2_z11; plot(Pn.time,Pn.signals.values(:,1),'c--','LineWidth',2);
Pn = S2_z21; plot(Pn.time,Pn.signals.values(:,1),'c-.','LineWidth',2);
Pn = S3_z11; plot(Pn.time,Pn.signals.values(:,1),'k--','LineWidth',2);
Pn = S3_z21; plot(Pn.time,Pn.signals.values(:,1),'k-.','LineWidth',2);
Pn = S4_z11; plot(Pn.time,Pn.signals.values(:,1),'b--','LineWidth',2);
Pn = S4_z21; plot(Pn.time,Pn.signals.values(:,1),'b-.','LineWidth',2);
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,2),'r-','LineWidth',2);
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,3),'m-','LineWidth',2);
ylim([-60 60]);
if isDisplayUnit==1
    xlabel('$t(s)$','Interpreter','latex','FontSize',FontSize);
    ylabel('$z_{j1}(rad/s)$','Interpreter','latex','FontSize',FontSize);
else
    xlabel(' ','Interpreter','latex','FontSize',FontSize);
    ylabel(' ','Interpreter','latex','FontSize',FontSize);
end
h=legend('$z_{11}$ under S1','$z_{21}$ under S1','$z_{11}$ under S2','$z_{21}$ under S2','$z_{11}$ under S3',...
    '$z_{21}$ under S3','$z_{11}$ under S4','$z_{21}$ under S4','$\rho_{j1}$','$-\rho_{j1}$');
set(gca,'FontName','Helvetica','FontSize',FontSize);
set(h,'Interpreter','latex');

axes('position',[0.35 0.2 0.45 0.2]);
hold on
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,1),'g--','LineWidth',2);
Pn = S1_z21; plot(Pn.time,Pn.signals.values(:,1),'g-.','LineWidth',2);
Pn = S2_z11; plot(Pn.time,Pn.signals.values(:,1),'c--','LineWidth',2);
Pn = S2_z21; plot(Pn.time,Pn.signals.values(:,1),'c-.','LineWidth',2);
Pn = S3_z11; plot(Pn.time,Pn.signals.values(:,1),'k--','LineWidth',2);
Pn = S3_z21; plot(Pn.time,Pn.signals.values(:,1),'k-.','LineWidth',2);
Pn = S4_z11; plot(Pn.time,Pn.signals.values(:,1),'b--','LineWidth',2);
Pn = S4_z21; plot(Pn.time,Pn.signals.values(:,1),'b-.','LineWidth',2);
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,2),'r-','LineWidth',2);
Pn = S1_z11; plot(Pn.time,Pn.signals.values(:,3),'m-','LineWidth',2);
axis([0.1 6 -3 3]);

%% zj2
figure('color','white');
hold on
box on
grid on
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,1),'g--','LineWidth',2);
Pn = S1_z22; plot(Pn.time,Pn.signals.values(:,1),'g-.','LineWidth',2);
Pn = S2_z12; plot(Pn.time,Pn.signals.values(:,1),'c--','LineWidth',2);
Pn = S2_z22; plot(Pn.time,Pn.signals.values(:,1),'c-.','LineWidth',2);
Pn = S3_z12; plot(Pn.time,Pn.signals.values(:,1),'k--','LineWidth',2);
Pn = S3_z22; plot(Pn.time,Pn.signals.values(:,1),'k-.','LineWidth',2);
Pn = S4_z12; plot(Pn.time,Pn.signals.values(:,1),'b--','LineWidth',2);
Pn = S4_z22; plot(Pn.time,Pn.signals.values(:,1),'b-.','LineWidth',2);
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,2),'r-','LineWidth',2);
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,3),'m-','LineWidth',2);
ylim([-300 300]);
if isDisplayUnit==1
    xlabel('$t(s)$','Interpreter','latex','FontSize',FontSize);
    ylabel('$z_{j2}(rad/s^2)$','Interpreter','latex','FontSize',FontSize);
else
    xlabel('$ $','Interpreter','latex','FontSize',FontSize);
    ylabel('$ $','Interpreter','latex','FontSize',FontSize);
end
h=legend('$z_{12}$ under S1','$z_{22}$ under S1','$z_{12}$ under S2','$z_{22}$ under S2','$z_{12}$ under S3',...
    '$z_{22}$ under S3','$z_{12}$ under S4','$z_{22}$ under S4','$\rho_{j2}$','$-\rho_{j2}$');
set(gca,'FontName','Helvetica','FontSize',FontSize);
set(h,'Interpreter','latex');

axes('position',[0.35 0.2 0.45 0.2]);
hold on
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,1),'g--','LineWidth',2);
Pn = S1_z22; plot(Pn.time,Pn.signals.values(:,1),'g-.','LineWidth',2);
Pn = S2_z12; plot(Pn.time,Pn.signals.values(:,1),'c--','LineWidth',2);
Pn = S2_z22; plot(Pn.time,Pn.signals.values(:,1),'c-.','LineWidth',2);
Pn = S3_z12; plot(Pn.time,Pn.signals.values(:,1),'k--','LineWidth',2);
Pn = S3_z22; plot(Pn.time,Pn.signals.values(:,1),'k-.','LineWidth',2);
Pn = S4_z12; plot(Pn.time,Pn.signals.values(:,1),'b--','LineWidth',2);
Pn = S4_z22; plot(Pn.time,Pn.signals.values(:,1),'b-.','LineWidth',2);
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,2),'r-','LineWidth',2);
Pn = S1_z12; plot(Pn.time,Pn.signals.values(:,3),'m-','LineWidth',2);
axis([0 0.1 -200 200]);
