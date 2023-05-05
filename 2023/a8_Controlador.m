%% Controlador PROPORCIONAL
clc

z = [''];
p = [-1 -0.5];
H = [1];                        % realimentación unitaria
[num, den] = zp2tf(num, den);
Gp = tf(num, den);              % FT de la Planta

kp = 1;
Gc = tf(kp);                    % FT del controlador proporcional

FTLA = Gc * Gp;                 % Para hacer el LG en linea 16

figure(1)
rlocus(FTLA)
    xlim([-1.5 1]);
    ylim([-3 3]);
    title('LGR Control Proporcional')
        % Si hablamos de estabilidad, es estable porque esta del lado negativo para cualquier valor de k

% Salida del Sistema en Lazo Cerrado
kp = 0.5;
Gc = tf(kp);
FTLC1 = feedback(Gc*Gp, H); % cierra el lazo de control y calcula la FTLC

kp = 3;
Gc = tf(kp);
FTLC2 = feedback(Gc*Gp, H);

kp = 5;
Gc = tf(kp);
FTLC3 = feedback(Gc*Gp, H);

figure(2)
step(FTLC1, FTLC2, FTLC3)
    % k=0.5 --> el polo se aleja a la izquierda, se establiza mas rapido y responde mas rapido
    % a medida que aumento el K oscila, y el sobreimpulso es mas grande

asd