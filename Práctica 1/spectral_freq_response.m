% % https://la.mathworks.com/matlabcentral/answers/151514-how-can-i-define-my-own-colororder-for-a-bodeplot
function spectral_freq_response(data, n_freqs, Alpha)
% Assuming normality in the errors, this is the amplitude of the ci.
mult = norminv(1-Alpha);
% Estimation

sys = spa(data,[],linspace(0, pi, n_freqs));
[mag, ph, w, sdmag, sdphase]  = bode(sys);

% Bode Diagram
mag = squeeze(mag);
sdmag = squeeze(sdmag);
ph = squeeze(ph);
sdphase = squeeze(sdphase);

% Log-Log Amplitude
figure()
subplot(2,1,1)
loglog(w, mag, '.-','Color', my_color('blue'))
grid on
hold on
loglog(w, mag+mult*sdmag, 'k:', w, mag-mult*sdmag,'k:');
ylabel('Amplitud (log)')

% Semilog x Phase.
subplot(2,1,2)
semilogx(w, ph,'.-', 'Color', my_color('orange'))
grid on
hold on
semilogx(w, ph+mult*sdphase,'k:', w, ph-mult*sdphase,'k:');
ylabel('Fase [grados]'); xlabel('Frecuencia (log) [rad/s]')
sgtitle(['Diagrama de Bode (\alpha = ',num2str(Alpha), ')'])
end