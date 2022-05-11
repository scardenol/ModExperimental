function [T, M_p, delta_y] = order2_plot(t, out)
    % Índices de interés.
    I_si = (out >= 0.95*out(end) & out <= 1.05*out(end));
    idx_si = find(I_si ~= 1, 1, 'last')+1;
    idx_10 = find(out > 0.1*out(end), 1); idx_90 = find(out > 0.9*out(end), 1);
    idx_tau = find(out <= 0, 1, 'last');
    delta_y = out(end) - out(1);

    % Retardo.
    tau = t(idx_tau);
    % Sobre impulso máximo.
    M_p = max(out) - out(end);
    % Tiempo de pico.
    t_p = t(out == max(out)) - tau;
    % Tiempo de crecimiento.
    t_r = t(idx_90) - t(idx_10) - tau;
    % Bandas de establecimiento.
    si = [0.95, 1.05]*out(end);
    % Tiempo de establecimiento.
    t_s = t(idx_si) - tau;
    T = [tau, t_r, t_p, t_s];

    figure()
    clf
    hold on
    grid on
    
    % Bandas de establecimiento.
    yline(si(1), 'r--')
    yline(si(2), 'r--')
    % Valor de estabilidad.
    yline(out(end), '-', {['y_{final} = ', num2str(out(end))]})
    % Margen extra para la gráfica.
    ylim([min(out)-0.2*max(out), 1.2*max(out)]);
    % Acerca en el eje x.
    xlim([min(t), max(t)])
    % Retardo
    xl = xline(tau, '--', {['\tau = ', num2str(tau)]});
    xl.LabelVerticalAlignment = 'bottom';
    xl.LabelHorizontalAlignment = 'center';
    % Tiempo de crecimiento.
    xl = xline(tau + t_r, '--', {['t_r = ', num2str(t_r)]});
    xl.LabelHorizontalAlignment = 'center';
    % Tiempo de pico.
    xl = xline(tau + t_p, '--', {['t_p = ', num2str(t_p)]});
    xl.LabelVerticalAlignment = 'bottom';
    xl.LabelHorizontalAlignment = 'center';
    xlabel('Tiempo'); ylabel('Amplitud');
    % Tiempo de establecimiento
    xl = xline(tau + t_s, '--', {['t_s = ', num2str(t_s)]});
    xl.LabelHorizontalAlignment = 'center';
    % Respuesta.
    plot(t, out, 'LineWidth', 2, 'Color', '#067CDF')
    
    ax = gca;
    ax.FontSize = 14;
    title({'Respuesta del sistema a una entrada', 'escalón unitario'}, 'FontSize', 20)
    hold off
end