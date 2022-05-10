%Naturaleza cualitativa de las soluciones (14)
% Ejercicio a)
clc

num = [1];
den = [1 2 2];
FTLC = tf(num, den)
figure(1)   %Crea una nueva ventana
impulse(FTLC)   %Grafica de la respuesta de impulso del sistema
xlim([0 20])
ylim([-0.5 0.5])
title('Respuesta del Sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Impulso ejercicio (a)')

figure(2)
pzmap(FTLC) %Grafica de polos y ceros
title('Polos y Ceros a la entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Polos y Ceros ejercicio (a)')

%% Ejercicio b)
clc

num = [1];
den = [1 1];
FTLC = tf(num, den)
figure(1)   %Crea una nueva ventana
impulse(FTLC)   %Grafica de la respuesta de impulso del sistema
xlim([0 20])
ylim([-0.5 0.5])
title('Respuesta del Sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Impulso ejercicio (b)')

figure(2)
pzmap(FTLC) %Grafica de polos y ceros
title('Polos y Ceros a la entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Polos y Ceros ejercicio (b)')

%% Ejercicio c)
clc

num = [1];
den = [1 -2 2];
FTLC = tf(num, den)
figure(1)   %Crea una nueva ventana
impulse(FTLC)   %Grafica de la respuesta de impulso del sistema
xlim([0 20])
ylim([-0.5 0.5])
title('Respuesta del Sistema a una entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Impulso ejercicio (c)')

figure(2)
pzmap(FTLC) %Grafica de polos y ceros
title('Polos y Ceros a la entrada Impulso')
ylabel('Amplitud')
xlabel('Tiempo')
legend('Polos y Ceros ejercicio (c)')