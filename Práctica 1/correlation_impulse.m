function correlation_impulse(data, n_lags, Alpha)
plotoptions = timeoptions('cstprefs');
plotoptions.Grid = 'on';
plotoptions.XLabel.String = 'Tiempo';
plotoptions.YLabel.String = 'Amplitud';
plotoptions.Title.String = 'Método de correlación: Secuencia de ponderación';


if (isequal(class(data), 'iddata'))
    fig = impulseplot(impulseest(data, n_lags), plotoptions);
    legend('Datos de entrenamiento')
elseif (isequal(class(data), 'cell') && isequal(class(data{1}), 'iddata'))
    fig = impulseplot(impulseest(data{1}, n_lags), data{2:end}, plotoptions);
    legend({'Datos de entrenamiento', ...
        repmat('Modelo estimado',length(data)-1)})
else
    fig = impulseplot(data{:}, plotoptions);
    legend({repmat('Modelo estimado',length(data))})
end

showConfidence(fig, norminv(1-Alpha))
hold off
end

