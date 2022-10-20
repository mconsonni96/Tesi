Data = fopen('ch1_CT.csv', 'r');
A = fscanf(Data, '%f');
T_CLK = 2000
SUM = sum(A)
CalibTable = (A./ SUM).*T_CLK;
x_axis = [1:1:length(A)]';

figure;
plot(x_axis,CalibTable,'LineWidth',2);
yticks([0 135 270])
xticks([0 250 500])
xlim([0 512])
ylim([-1 270])
% yline(0,'-k')
title('Calibration Table', FontSize=22)
xlabel('Bin Number',FontSize=22)
ylabel('t_p [ps]',FontSize=22)
