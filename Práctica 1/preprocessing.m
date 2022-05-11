function [y, y_train, y_test] = preprocessing(out)
y = detrend(out);
y = y - mean(y);
cut = ceil(length(y)/2);
y_train = y(1:cut); y_test = y((cut+1):end);

plot(1:cut, y_train, 'LineWidth', 1.5, 'Color', my_color('blue'))
hold on; grid on
plot(cut+1:length(y), y_test, 'LineWidth', 1.5, 'Color', my_color('red'))
%plot(out - mean(out), 'LineWidth', 1.5, 'Color', my_color('red'))
legend({'Nuevo', 'Baja frecuencia'})
xlabel('Índice'); ylabel('Salida');
title('Salida de testeo y validación')
legend({'Train', 'Test', 'Corte'})
xlim([0, length(y)]); ylim([min(y), max(y)])
xline(cut, '--', 'LineWidth', 2)
end