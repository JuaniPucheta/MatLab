clc
hold on % para que aparezcan las 2 funciones graficadas
        % si quisiese hacer step(G1) step(G2)

% Cuando son comandos irrelevantes, ponemos ; al final, para que no lo
% muestre en la Command Window
T1 = 0.1;
T2 = 0.2;

num = [1]; 
den = [T1 1]; 
G1 = tf(num, den)

num = [1]; 
den = [T2 1]; 
G2 = tf(num, den)

step(G1, G2) 
title('Respuesta al Escalon - Sistema de Primer Orden')
xlabel('Amplitud')
ylabel('Tiempo')
legend('C1(t) Tau 0.1', 'C2(t) Tau 0.2')
    % C1 responde de manera mas rapida y se estabiliza antes que C2
    % Mas chico es el Tau => mas rapido responde el sistema
    % Mas grande (eje izquierda) es el polo => mas rapido responde el sistema
    % en Tau=1 alcanza el 63,2% de la respuesta final



