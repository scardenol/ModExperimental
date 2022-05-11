function [all, train, test] = preprocessing_iddata(output, input, Ts)
% Column vectors.
output = output(:); input = input(:);
% Output.
y = detrend(output);
y = y - mean(y);
cut = ceil(length(y)/2);
y_train = y(1:cut); y_test = y((cut+1):end);
% Input.
u = input - mean(input);
u_train = u(1:cut); u_test = u((cut+1):end);
% iddata.
all = iddata(y, u, Ts);
train = iddata(y_train, u_train, Ts);
test = iddata(y_test, u_test, Ts);
% Plots.
subplot(2,1,1)
plot(1:cut, y_train, 'LineWidth', 1.5, 'Color', my_color('blue'))
hold on; grid on
plot(cut+1:length(y), y_test, 'LineWidth', 1.5, 'Color', my_color('red'))
xline(cut, '--', 'LineWidth', 2, 'HandleVisibility','off')

xlabel('Índice'); ylabel('Salida');
title('Salida de testeo y validación')
xlim([0, length(y)]); ylim([min(y), max(y)])
legend({'Train', 'Test'})

subplot(2,1,2)
plot(1:cut, u_train, 'LineWidth', 1.5, 'Color', my_color('blue'))
hold on; grid on
plot(cut+1:length(y), u_test, 'LineWidth', 1.5, 'Color', my_color('red'))
xline(cut, '--', 'LineWidth', 2, 'HandleVisibility','off')

xlabel('Índice'); ylabel('Entrada');
title('Entrada de testeo y validación')
xlim([0, length(y)]); ylim([min(y), max(y)])
legend({'Train', 'Test'})

sgtitle('Datos preprocesados')
hold off
end