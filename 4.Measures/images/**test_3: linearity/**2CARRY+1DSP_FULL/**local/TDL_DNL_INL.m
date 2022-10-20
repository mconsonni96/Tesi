Data = fopen('ch1_CT.csv', 'r');
A = fscanf(Data, '%f');
T_CLK = 2000
SUM = sum(A)
CalibTable = (A./ SUM).*T_CLK;
CT_nonzeros = nonzeros(CalibTable);
x_axis_max = length(CT_nonzeros);
x_axis = [1:1:x_axis_max]';

avg = mean(CT_nonzeros);
dnl_abs = CT_nonzeros - avg;

figure;
plot(x_axis,dnl_abs,'LineWidth',2);
xlim([0 x_axis_max])
yline(0,'-.k')
grid on;
grid minor;
title('Differential Non-Linearity of the TDL', FontSize=22)
xlabel('Bin number',FontSize=22)
ylabel('Linearity Error [ps]',FontSize=22)

inl_abs = cumsum(dnl_abs);

figure;
plot(x_axis,inl_abs,'LineWidth',4);
xlim([0 x_axis_max])
yline(0,'-.k')
grid on;
grid minor;
title('Integral Non-Linearity of the TDL', FontSize=22)
xlabel('Bin number',FontSize=22)
ylabel('Linearity Error [ps]',FontSize=22)