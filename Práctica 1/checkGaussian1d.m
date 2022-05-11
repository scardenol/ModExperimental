function S = checkGaussian1d(y, alpha)
% Distribution test.
S = struct();
S.ad = {'Anderson-Darling',...
    ['H', num2str(adtest(y, 'Alpha', alpha))],...
    'H0: Normalidad con enfasis en las colas.'};
S.jb = {'Jarque-Bera',...
    ['H', num2str(jbtest(y, alpha))],...
    'H0: Mean and Variance of normal distriution.'};
S.chi2 = {'Chi-square goodness-of-fit',...
    ['H', num2str(chi2gof(y, 'Alpha', alpha))],...
    'H0: Mean and Variance of normal distriution.'};
S.alpha = alpha;

% QQ-plot.
figure('Position',[440,93,560,704])
subplot(2,1,1)
qqplot(y)
title('Gráfico cuantil-cuantil', 'FontSize', 16)
xlabel('Cuantiles de una normal estándar');
ylabel('Cuantiles de la salida del sistema')
grid on
% Histogram.
subplot(2,1,2)
histfit(y, 35, 'kernel')
grid on
title('Histograma', 'FontSize', 16)
legend({'Histograma', 'Densidad no parámetrica'})
xlabel('Salida'); ylabel('Frecuencia')
hold off
end
