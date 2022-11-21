Data = fopen('CT_NOsubint.csv', 'r');
A = fscanf(Data, '%f');
T_CLK = 2000
SUM = sum(A)
CalibTable = (A./ SUM).*T_CLK;
CalibTable_floor = floor(CalibTable);
CalibTable_nonzero = nonzeros(CalibTable_floor);
CalibTable_sorted = sort(CalibTable_nonzero);

uniqueCT = unique(CalibTable_sorted);
x_axis = [1:1:max(uniqueCT)];

for k = 1:(max(x_axis))
    count(k) = sum(CalibTable_sorted==x_axis(k));
end

total = sum(count);
y_axis = (count./total).*100;
figure;
plot(x_axis,y_axis,'r-', 'LineWidth',5);
grid on;
% yticks([0 10 20])
% xticks([0 250 500])
xlim([0 (max(x_axis)+1)])
ylim([-1 (max(y_axis)+1)])
% yline(0,'-k')
title('Bin Dispersion', FontSize=22)
xlabel('t_p [ps]',FontSize=22)
ylabel('Occurrence [%]',FontSize=22)
