%% inciso b) Controlador PROPORCIONAL
clc

z = -8;
p = [-3 -6 -10];
H = [1];                        % realimentación unitaria
[num, den] = zp2tf(z, p, 1);
Gp = tf(num, den);              % FT de la Planta

kp = 1;
Gc = tf(kp);                    % FT del controlador proporcional

FTLA = Gc * Gp;                 % Para hacer el LG 

figure(1)
rlocus(FTLA)
    title('LGR Control Proporcional')
    ylabel('Amplitud')
    xlabel('Frecuencia')
    legend('kp=3')
    % sistema estable, al estar los polos (en LA) a la izquierda del eje imaginario
    % posee 3 polos y 1 cero
    % las ramas empiezan en los polos y terminan en los ceros, tiene 3 ramas en LA
    % posee un punto de desprendimiento, saliendo al eje imaginario

%---- Salida del sistema variando el Controlador Proporcional ----
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
    ylabel('Amplitud')
    xlabel('Frecuencia')
    title('Respuesta Escalon - P')
    legend('kp=0.5', 'kp=3', 'kp=5')

%% inciso c)
z = '';
p = [-3 -6 -10];
H = 1;
[num, den] = zp2tf(z,p,H);
Gp = tf(num, den);

kp = 1;
Ti = 1;     % prueba
Td = 0.5;   % prueba

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);
FTLAPID = GcPID * Gp;
FTLC = feedback(FTLAPID, H)

figure(1)
step(FTLC)
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('kp=1 | Ti=1 | Td=0.5')
    ylim([0 2])

%-----variando los parametros IyD-----
Td = 0.1;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);
FTLC1 = feedback(GcPID*Gp, H);

Td = 2;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID2 = tf(num, den);
FTLC2 = feedback(GcPID2*Gp, H);

Td = 3;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID3 = tf(num, den);
FTLC3 = feedback(GcPID3*Gp, H);

figure(2)
    step(FTLC1, 'g', FTLC2, 'b',FTLC3, 'r')
    xlim([-1 10]);
    title('Controlador Proporcional Integral Derivativo (PID)')
    legend('C(t) Td=0.1', 'C(t) Td=2', 'C(t) Td=3')
