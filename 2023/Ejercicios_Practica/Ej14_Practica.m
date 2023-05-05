%% Naturaleza Cualitativa de las Soluciones
% Hallar y(t) ante una entrada Impulso, dadan ecuaciones diferenciales

num = [1];
den = [1 2 2];
G = tf(num, den)
impulse(G)          % Grafica de la respuesta de impulso del sistema
    xlim([0 20]);
    ylim([-0.5 0.5]);
    title('Respuesta Sistema entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Impulso ejercicio (a)');
    % los polos con parte real negativo, y complejos conjugados, el sistema se estabiliza


figure(2)
pzmap(G)    % Grafica de polos y ceros
    title('Polos y Ceros a la entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Polos y Ceros ejercicio (a)');

%% Ejercicio (b)
clc;

num = [1];
den = [1 1];
G = tf(num, den);
impulse(G);
    xlim([0 20]);
    title('Respuesta Sistema entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Impulso ejercicio (b)');

figure(2);
pzmap(G)
    title('Polos y Ceros a la entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Polos y Ceros ejercicio (b)');

%% Ejercicio (c)
clc;

num = [1];
den = [1 -2 2];
G = tf(num, den);
impulse(G);
    xlim([0 20]);
    title('Respuesta Sistema entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Impulso ejercicio (c)');

figure(2);
pzmap(G)
    title('Polos y Ceros a la entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Polos y Ceros ejercicio (c)');

%% Ejercicio (d)
clc;

num = [1];
den = [1 -1];
G = tf(num, den);
impulse(G);
    xlim([0 20]);
    title('Respuesta Sistema entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Impulso ejercicio (d)');

figure(2);
pzmap(G)
    title('Polos y Ceros a la entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Polos y Ceros ejercicio (d)');

%% Ejercicio (e)
clc;

num = [1];
den = [1 0 1];
G = tf(num, den);
impulse(G);
    xlim([0 20]);
    title('Respuesta Sistema entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Impulso ejercicio (e)');

figure(2);
pzmap(G)
    title('Polos y Ceros a la entrada Impulso');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('Polos y Ceros ejercicio (e)');


