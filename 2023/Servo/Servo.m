%% Problema Servo
num = [18];
den = [1 2 26];
FTLC = tf(num, den);
step(FTLC)
    title('Respuesta a una Entrada Escalon - Problema Servo')
    xlabel('Tiempo')
    ylabel('Amplitud')
    legend('C(t)', 'Entrada Escalon')
    % steady state 0.692: valor donde se estabiliza
    % Ess: diferencia entre escalon y donde se estabiliza el sistema

figure(2)
    pzmap(FTLC)