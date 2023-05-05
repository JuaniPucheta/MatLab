%% Ejercicio 7 - SSO Impulso
hold on;                        % graficar +1 graficas en el mismo pop-up

wn = 2;
z = 0.1;                        % SUBAMORTIGUADO

num = [wn^2];
den = [1 (2*z*wn) wn^2];
G = tf(num, den)                % FT
    % oscila, con exponencial negativa

%---------------z = 1-----------------------------------------
z = 1;                          % CRITICAMENTE AMORTIGUADO
num = [wn^2];
den = [1 (2*z*wn) wn^2];
G1 = tf(num, den)                
%---------------z = 2----------------------------------------
z = 2;                          % SOBREAMORTIGUADO
num = [wn^2];
den = [1 (2*z*wn) wn^2];
G2 = tf(num, den)                

%-------------Graficando Impulso----------------------------
impulse(G, G1, G2)              % funcion Impulso
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Sistema de 2do Orden - variando Z');
    legend('G(t) z=0.1', 'G1(t) z=1', 'G2(t) z=2')

hold off;

figure(2);
pzmap(G,G1,G2);                 
    % grafica los polos (complejos conjugados)
    % tenemos 2 pares de complejos conjugados
