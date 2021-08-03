clc
clear all
close all

load zero_alfa.mat
load zett_alfa.mat
load etta_alfa.mat
load endo_alfa.mat

Tend = 395;

figure(1)
subplot(2,2,1)
hM = plot(per(1:Tend-1,:),ySimT_zero(1:Tend-1,:),'Color',[0.05 0.7 0.05],'LineWidth',2);
hold on
hD = plot(per(1:Tend-1,:),yd(1:Tend-1,:),'k-');
hold off
hMGroup = hggroup;
hDGroup = hggroup;
set(hM,'Parent',hMGroup)
set(hD,'Parent',hDGroup)
set(get(get(hMGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on'); 
set(get(get(hDGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on'); 
legend('model','data','Orientation','vertical','Location','NorthWest')
grid on
ylim([0.35 1])
xlim([per(1,1) per(Tend-1,1)])
ylabel('1700=1')
text('Position',[1400 0.45],'string','X_{t+1}=X_{t}','Color',[0.05 0.7 0.05])
title('constant productivity')
subplot(2,2,2)
plot(per(1:Tend-1,:),ySimT_zett(1:Tend-1,:),'Color',[0.05 0.7 0.05],'LineWidth',2)
hold on
plot(per(1:Tend-1,:),yd(1:Tend-1,:),'k-')
hold off
grid on
ylim([0.35 1])
xlim([per(1,1) per(Tend-1,1)])
text('Position',[1400 0.45],'string','X_{t+1}=\zeta+X_{t}','Color',[0.05 0.7 0.05])
title('arithmetic growth')
subplot(2,2,3)
plot(per(1:Tend-1,:),ySimT_etta(1:Tend-1,:),'Color',[0.05 0.7 0.05],'LineWidth',2)
hold on
plot(per(1:Tend-1,:),yd(1:Tend-1,:),'k-')
hold off
grid on
ylim([0.35 1])
xlim([per(1,1) per(Tend-1,1)])
xlabel('years')
ylabel('1700=1')
text('Position',[1400 0.45],'string','X_{t+1}=(1+\eta)X_{t}','Color',[0.05 0.7 0.05])
title('exponential growth')
subplot(2,2,4)
plot(per(1:Tend-1,:),ySimT_endo(1:Tend-1,:),'Color',[0.05 0.7 0.05],'LineWidth',2)
hold on
plot(per(1:Tend-1,:),yd(1:Tend-1,:),'k-')
hold off
grid on
ylim([0.35 1])
xlim([per(1,1) per(Tend-1,1)])
xlabel('years')
text('Position',[1400 0.45],'string','X_{t+1}=(1+\gamma L_{t})X_{t}','Color',[0.05 0.7 0.05])
title('Boserup-Kremer endogenous growth')
saveas(gcf,'FigHA','epsc')