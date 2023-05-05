%% Respuesta Escalón - SPO
clc

Tau1 = 0.1;
Tau2 = 0.2;

num = [1];
den = [Tau1 1];
G1 = tf(num, den)

num2 = [1];
den2 = [Tau2 1];
G2 = tf(num, den)

step(G1, G2)
    title('Respuesta al Escalon - Sistema de Primer Orden')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('C1(t) Tau 0.1', 'C2(t) Tau 0.2')

%% Funcion Senoidal - SPO
t = (0:0.1:10);
u = 5*sin(t);

num = [1];
den = [5 1];
G = tf(num, den);

% Definimos la entrda senoidal
lsim(G, u, t)
    % esta desfasada y atenuada, la amplitud es menor, tiene la misma frecuencia
    title('Respuesta SPO - Entrada Senoidal')
    xlabel('Tiempo')
    ylabel('Amplitud')

    