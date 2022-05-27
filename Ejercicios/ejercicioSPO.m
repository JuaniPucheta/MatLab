clc
hold on         %o sino, directamente step(G1, G2)

T1 = 0.1;       %Tau 1
T2 = 0.2;       %Tau 2

num = [1];
den = [T1 1];
G1 = tf(num, den)

num = [1];
den = [T2 1];
G2 = tf(num, den)

step(G1)
step(G2)
title('Respuesta al Escalon - Sistema de Primer Orden')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C1(t) Tau 0.1', 'C2(t) Tau 0.2')

