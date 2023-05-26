%% Diagrama de Bode y Pico de Resonancia
FTLA = zpk(-70, [0 -4 -25], 8)  % Ceros, polos, k
figure(1)
bode(FTLA)
grid

FTTD = zpk(-70, [0 -4 -25], 8)  % Funcion Transferencia Trayectoria Directa
FTLC = feedback(FTTD, 1);
step(FTLC);

%% Ancho de Banda
FTLC1 = tf(1, [1 1]);
FTLC2 = tf(1, [3 1]);

figure(1)
    bode(FTLC1);
figure(2)
    bode(FTLC2)
    % FTLC2 tiene una ganancia máxima mayor que FTLC1, y frecuencia de
    % cruce más alta. FLTC2 tiene mayor ancho de banda

figure(3)
    step(FTLC1, FTLC2)
    legend('C(t) FTLC1', 'C(t) FTLC2');

%% Pico de Resonancia
FTLC1 = tf(9, [1 3 9]);
FTLC2 = tf(9, [1 0.5 9]);

figure(1)
    bode(FTLC1, FTLC2)
    % FTLC2 tiene un pico de resonancia mas pronunciado que FTLC1

figure(2)
    step(FTLC1, FTLC2)
    legend('C(t) FTLC1', 'C(t) FTLC2');
    