%% Problema Servo
num = [18];
den = [1 2 26];
FTLC = tf(num, den);

figure(1)
hold on;
step(FTLC, 'b')
    t = (-1:0.01:7);        % tiempo donde va a estar definida (0.01 es el incremento)
unitstep = t>=0;            % funcion escalon
    plot(t, unitstep, '-r');

title('Respuesta a una Entrada Escalon - Problema Servo')
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t)', 'Entrada Escalon');
    xlim([-1 7]);
    ylim([0 1.5]);
    % steady state 0.692: valor donde se estabiliza
    % Ess: diferencia entre escalon y donde se estabiliza el sistema