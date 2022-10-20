Data = fopen('ch0_CT.csv', 'r');
A = fscanf(Data, '%f');
T_CLK = 2000
SUM = sum(A)
CalibTable = (A./ SUM).*T_CLK;
x_axis = [1:1:length(A)]';

figure;
plot(x_axis,CalibTable,'LineWidth',2);
yticks([0 10 20])
xticks([0 500 1000])
xlim([0 1024])
ylim([-1 20])
% yline(0,'-k')
title('Calibration Table', FontSize=22)
xlabel('Bin Number',FontSize=22)
ylabel('t_p [ps]',FontSize=22)
