Data = fopen('test.txt', 'r');
A = fscanf(Data, '%d');
x_axis = [1:1:length(A)]';

figure;
% plot(x_axis,A,'LineWidth',2);
% % yticks([0 10 20])
bar(A)
% histfit(A)
hold on;
f = fit(x_axis,A,'gauss1')
gaussian = plot(f,x_axis,A);
set(gaussian,'LineWidth',2);
xticks([1:4:2000])
xlim([503 565])
ylim([-50000 inf])
% yline(0,'-k')
title('Histogram with Sub-Interpolation', FontSize=22)
xlabel('Time difference [ps]',FontSize=22)
ylabel('Number of events',FontSize=22)


