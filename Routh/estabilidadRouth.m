%% Criterio de Estabilidad de Routh
clc
num=[1];
den=[1 2 3 4 5];
FTLC = tf(num,den)

figure(1)
impulse(FTLC)
xlim([0 10])
ylim([-2 2])
title('Respuesta del sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)% Devuelve los polos y ceros

%% Caso Especial N°1

clc
num=[1];
den=[1 2 1 2];
FTLC = tf(num,den)

figure(1)
impulse(FTLC)
xlim([0 10])
ylim([-2 2])
title('Respuesta del sistema a una entrada Impulso - CE N°1')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)% Devuelve los polos y ceros

%% Caso Especial N°2

clc
num=[1];
den=[1 2 24 48 -25 -50];
FTLC = tf(num,den)

figure(1)
impulse(FTLC)
xlim([0 10])
ylim([-2 2])
title('Respuesta del sistema a una entrada Impulso - CE N°2')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)% Devuelve los polos y ceros

