clc;
hold on;
t = (0:0.1:10);
unitstep = t>=0;
plot(t, unitstep, '-b');

k=1;
num=[k];
den=[1 4 (8+k)];
FTLA = tf(num,den);
step(FTLA, '-y');
    title('Respuesta del sistema');
    ylabel('Tiempo');
    xlabel('Amplitud');