%%Ejercicio 19 (BE2)
hold on;
t = (0:0.1:10)';
unitstep = t >= 0;      % para dibujar el escalon unitario
plot(t, unitstep, '-b')     %-b es un color

k = 1;
num = [k];
den = [1 4 1];
FTLA = tf(num, den);
FTLC = feedback (FTLA, 1);  %pone el lazo abierto y la retroalimentacion (1) para no hacer todo de nuevo
step(FTLC, '-r');   %-r es un color

k = 3;
num = [k];
den = [1 4 (1+k)];
FTG1 = tf(num, den)
step(FTG1, '-y'); 

k = 4;
num = [k];
den = [1 4 (1+k)];
FTG2 = tf(num, den)
step(FTG2, '-c'); 

k = 8;
num = [k];
den = [1 4 (1+k)];
FTG3 = tf(num, den)
step(FTG3, '-k'); 

k = 20;
num = [k];
den = [1 4 (1+k)];
FTG4 = tf(num, den)
step(FTG4, '-m'); 

legend('step', 'k=1','k=3','k=4','k=8','k=20')
figure(2)
rlocus(FTLA);   %el LG siempre va a ser FTLA
%Grafica los 2 polos -2-raiz3 y -2+raiz3
