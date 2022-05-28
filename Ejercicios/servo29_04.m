%% Error en Estado Estacionario
figure(1)
hold off
hold on % Permite hacer 2 graficas en la misma figura

u = ones(201); %escalon, genera 201 unos
t = 0:0.1:20; %va del 0 al 20 con un incremento del 0.1
plot(t,u) 

num = [9];
den = [1 2 26];
FTLC = tf(num, den)
step(FTLC)
xlim([0 10])
ylim([0 1.2])
title('Respuesta a una entrada Escalón - Problema SERVO')
ylabel('Amplitud')
xlabel('Tiempo')
legend('C(t)')

figure(2)
pzmap(FTLC)