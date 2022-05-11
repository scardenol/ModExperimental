function I = plot_outliers(y, type)
clf
try
    I = find(isoutlier(y, type));
catch
    error('Not valid type.')
end
plot(y, 'LineWidth', 1.5, 'Color', my_color('blue'))
grid on
hold on

plot(I, y(I), '*', 'Color', my_color('red'), 'LineWidth', 2.5)
xlim([1, length(y)]); ylim([0.95*min(y), 1.05*max(y)])
hold off
xlabel('Índice'); ylabel('Salida')
switch type
    case {'mean'}
        yline(mean(y) + 3*[-std(y), std(y)], '--')
        title('Datos atípicos: Método no tradicional')

    case {'median'}
        c = -1/(sqrt(2) * erfcinv(3/2));
        mad = c*median(abs(y-median(y)));
        yline(median(y) + 3*[-mad, mad], '--')
        title('Datos atípicos: Método robusto')

    case {'quartile'}
        yline([quantile(y, 0.25) - 1.5*iqr(y), ...
            quantile(y, 0.75) + 1.5*iqr(y)], '--')
        title('Datos atípicos: Método no paramétrico')
    otherwise
        error('Not valid type.')

end