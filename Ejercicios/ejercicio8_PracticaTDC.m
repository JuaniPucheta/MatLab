%% Ejercicio (8)
hold on;

z = ''; % Donde se hace 0 el numerador, se pone '' haciendo referencia que no tiene 0
k = 1; % Ganancia

p = [-2.5+3.58224i;-2.5-3.5824i]; % polos
[num, den] = zp2tf(z,p,k);
G = tf(num,den)

% Variando la parte real de p a -1.5

p = [-1.5+3.58224i;-1.5-3.58224i];
[num1, den1] = zp2tf(z,p,k);
G1 = tf(num1, den1)

% Variando la parte real de p a -0.5

p = [-0.5+3.58224i;-0.5-3.58224i];
[num2, den2] = zp2tf(z,p,k);
G2 = tf(num2, den2)

impulse(G,'-b', G1,'-r', G2,'-g')
title("Funcion impulso de Segundo Orden - Variando la parte real")
xlabel("Tiempo")
ylabel("Amplitud")
legend('p = -2.5', 'p = -1.5', 'p = -0.5')

%% Variando la parte imaginaria

hold on;

z = ''; % Donde se hace 0 el numerador, se pone '' haciendo referencia que no tiene 0
k = 1; % Ganancia

p = [-2 + 3.5i; -2 - 3.5i]; % polos
[num, den] = zp2tf(z,p,k);
G = tf(num,den)

% Variando la parte real de p a -1.5

p = [-2 + 5i; -2 - 5i];
[num1, den1] = zp2tf(z,p,k);
G1 = tf(num1, den1)

% Variando la parte real de p a -0.5

p = [-2 + 6.5i; -2 - 6.5i];
[num2, den2] = zp2tf(z,p,k);
G2 = tf(num2, den2)

impulse(G,'-b', G1,'-r', G2,'-g')
title("Funcion impulso de Segundo Orden - Variando la parte imaginaria")
xlabel("Tiempo")
ylabel("Amplitud")
legend('p = -3.5', 'p = -5', 'p = -6.5')