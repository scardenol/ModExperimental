function linear_curve(est, u, u_min, u_max)
est_range = [min(est), max(est)];
[~, idx1] = ismember(u_min, u);
[~, idx2] = ismember(u_max, u);
I = idx1:idx2; clear idx1 idx2
u_int = u(I);
est_int = est(I);

% Regression.
reg = fitlm(u_int, est_int);
betas = polyfit(u_int, est_int, 1);
lf = @(x) betas(1)*x + betas(2);

% R2 and adjusted R2.
r2 = reg.SSR / reg.SST;
r2_adj = 1 - (1-r2)*(reg.NumObservations - 1) / (reg.NumObservations - reg.NumCoefficients - 1);

% Results and plots.
disp(reg)
figure()
subplot(1,2,1)
plot(u, est, 'LineWidth', 2, 'Color', my_color('blue1'))
hold on
grid on

plot(u, lf(u),  'k--')

line([u_min, u_min], est_range, 'Color', my_color('red'))
line([u_max, u_max], est_range, 'Color', my_color('red'))
ylim(est_range); xlabel('Entrada'); ylabel('Valor de estabilización')
hold off

subplot(1,2,2)
plot(u_int, lf(u_int), '--k', 'LineWidth', 1.5)
hold on
grid on
plot(u_int, est_int, 'LineWidth', 2, 'Color', my_color('blue1'))

xlim([u_min, u_max])
text( (u_max - u_min) / 5 + u_min, ...
    est_int(1) + (est_int(end) - est_int(1)) / 5, ['R^2 ajustado = ', num2str(round(r2_adj,4))])
    %['y = ', num2str(round(betas(2),2)), ' + ' num2str(round(betas(1),2)),'u' ])
xlabel('Entrada'); %ylabel('Valor de estabilización')

sgtitle('Curva de linealidad')
end

