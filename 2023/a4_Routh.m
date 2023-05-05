%% Criterio Routh
clc

num = [1];
den = [1 2 3 4 5];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 10])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('C(t)')
    % se genera una salida inestable

figure(2)
pzmap(FTLC)
    % tenemos 2 polos inestables a la derecha del eje Imag.

%% Caso cambiando den (criticamente estable)
clc

num = [1];
den = [1 2 1 2];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 10])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('C(t)')
    % se genera una salida criticamente estable
    % oscila indefinidamente

figure(2)
pzmap(FTLC)
    % tenemos polos sobre el eje imaginario (salida oscilante)

%% Caso 2 cambiando den (inestable)
clc

num = [1];
den = [1 2 24 48 -25 -50];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 10])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('C(t)')
    % se genera una salida inestable

figure(2)
pzmap(FTLC)
    % tenemos un polo inestable (a la derecha)