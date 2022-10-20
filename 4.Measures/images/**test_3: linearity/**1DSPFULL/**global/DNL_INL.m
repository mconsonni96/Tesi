Data = fopen('test.txt', 'r');
A = fscanf(Data, '%d');
% B = zeros([100 1]);
% A = [A; B];
LSB = 1.99994; %ps
A_nonzero = nonzeros(A);
number_bins = [1:1:length(A_nonzero)]';
x_axis = number_bins.*LSB;
index_of_last = max(x_axis)
avg = mean(A_nonzero);
dnl_rel = (A_nonzero./avg) - 1;
dnl_abs = dnl_rel .* LSB;
%y_dnl = dnl_abs .* 100 %percentuale


figure;
plot(x_axis,dnl_abs);
xlim([0 index_of_last])
yline(0,'-.k')
grid on;
grid minor;
title('Differential Non-Linearity of the TDC', FontSize=22)
xlabel('Time Measurement [ps]',FontSize=22)
ylabel('Linearity Error [ps]',FontSize=22)

inl_abs = cumsum(dnl_abs);

figure;
plot(x_axis,inl_abs,LineWidth=4);
xlim([0 index_of_last])
yline(0,'-.k')
grid on;
grid minor;
title('Integral Non-Linearity of the TDC', FontSize=22)
xlabel('Time Measurement [ps]',FontSize=22)
ylabel('Linearity Error [ps]',FontSize=22)
