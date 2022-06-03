%% Diagrama de BODE y Pico de Resonancia
FTLA = zpk(-70,[0 -4 -25],8)%-------------- ceros, polos, k
FTTD = zpk(-70,[0 -4 -25],8)%-------------- funcion transferencia trayectoria directo
figure(1)
bode(FTLA)
grid

FTLC = feedback(FTTD,1)%------------------- el 1 es H
step(FTLC)

%% Ancho de banda
FTLC1 = tf(1, [1 1])
FTLC2 = tf(1, [3 1])
figure(1)
bode(FTLC1)
figure(2)
bode(FTLC2)

figure(3)
step(FTLC1, FTLC2)
legend('C(t) FTLC1', 'C(t) FTLC2')

%% Pico de Resonancia
FTLC1 = tf(9, [1 3 9])
FTLC2 = tf(9, [1 0.5 9])
figure(1)
bode(FTLC1, FTLC2)

figure(3)
step(FTLC1, FTLC2)
legend('C(t) FTLC1', 'C(t) FTLC2')

