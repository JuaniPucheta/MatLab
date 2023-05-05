%% SSO Entrada Impulsional - Variando parte REAL
hold on;

z = ''; % Donde se hace 0 el numerador, se pone '' haciendo referencia que no tiene 0
k = 1;  % Ganancia

p = [-2.5 + 3.5824i, -2.5 - 3.5824i]; % polos
[num, den] = zp2tf(z,p,k)
G = tf(num, den)

%------------ variando parte real a -1.5 -----------
p = [-1.5 + 3.5824i, -1.5 - 3.5824i];
[num1, den1] = zp2tf(z,p,k)
G1 = tf(num1, den1)

%------------ variando parte real a -0.5 -----------
p = [-0.5 + 3.5824i, -0.5 - 3.5824i];
[num2, den2] = zp2tf(z,p,k)
G2 = tf(num2, den2)

impulse(G,'-b', G1,'-r', G2,'-g');
xlabel('Tiempo');
ylabel('Amplitud');
title('Funcion impulso 2do Orden - variando parte Real');
legend('-2.5', '-1.5', '-0.5')
    % mientras más alejado del origen, se estabiliza más rápido
    % cuando se cambia la parte real, cambia la amplitud de la oscilación 

%% Variando parte IMAGINARIA
z = '';
k = 1;
p = [-2 + 3.5i, -2 - 3.5i];

[num, den] = zp2tf(z,p,k)
G = tf(num, den)

%------------ variando parte imaginaria a 5 -----------
p = [-2 + 5, -2 - 5i];
[num1, den1] = zp2tf(z,p,k)
G1 = tf(num1, den1)

%------------ variando parte imaginaria a 6.5 -----------
p = [-2 + 6.5i, -2 - 6.5i];
[num2, den2] = zp2tf(z,p,k)
G2 = tf(num2, den2)

impulse(G,'-b',G1, '-r',G2, '-g');
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Funcion impulso 2do Orden - variando parte Imaginaria');
    legend('3.5i', '5i', '6.5i')
    % a medida que se aleja del eje real (se hace mas grande negativamente), oscila menos
    % estamos evaluando el pico de la oscilacion, hasta donde llega, para
        % ver si permitimos tal oscilacion 

hold off;

figure(2)
pzmap(G,G1,G2)
