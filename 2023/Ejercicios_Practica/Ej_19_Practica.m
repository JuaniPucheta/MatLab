%% Esbozar LGR y especificar valores de K analizando oscilacion

k = 1;      % estable
%k = 3;      % estable, pequeño overshoot
%k = 4;      % estable, overshoot poco mas grande
%k = 8;      % estable, aparece una oscilacion
%k = 20;     % estable, mas oscilacion 
num = [k];
den = [1 4 (1+k)];
FTLA = tf(num, den);
FTLC = feedback(FTLA, 1);

figure(2)
rlocus(FTLA);

figure(3);
step(FTLC);

