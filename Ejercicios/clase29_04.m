%Criterio Estabilidad Routh-Hurwitz
%Caso especial N°1
clc

num = [1];
den = [1 2 1 2];
FTLC = tf(num, den)
figure(1)
impulse(FTLC)
xlim([0 20])
ylim([-0.5 0.5])
title('Respuesta del Sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)

%%Caso especial N°2
clc

num = [1];
den = [1 2 24 48 -25 -50];
FTLC = tf(num, den)
figure(1)
impulse(FTLC)
xlim([0 20])
ylim([-0.5 0.5])
title('Respuesta del Sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)




