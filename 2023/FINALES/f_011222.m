% en PC/Para_rendir
%% Ejercicio diseño controlador
clc 
num = 1;
den = [1 6 0];
Gp = tf(num, den);

kp = 1;
Gc = tf(kp);

FTLA = Gp * Gc

figure(1)
    rlocus(FTLA)

