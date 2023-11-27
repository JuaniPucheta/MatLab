%% Ejercicio 1 - LGR Proporcional
clc
z = [-8];
p = [-3 -6 -10];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den)

kp = 1;
GcP = tf(kp);

FTLA = GcP * Gp;

figure(1)
    rlocus(FTLA)
    title('LGR Controlador Proporcional')
    % es estable, los polos estan a la izquierda

%====Salida del Sistema en LC====
FTLC1 = feedback(GcP*Gp, 1);

kp = 10;
    GcP = tf(kp);
    FTLC2 = feedback(GcP*Gp, 1);

kp = 25;
    GcP = tf(kp);
    FTLC3 = feedback(GcP*Gp, 1);

figure(2)
step(FTLC1, FTLC2, FTLC3)
    title('Escalon - Controlador Proporcional')
    legend('kp = 1', 'kp = 10', 'kp = 25')
    % a medida que aumento el k, el sobreimpulso es mayor
        % se estabiliza mas rapido y responde mas rapido

%% Ejercicio 2 - Diseñar controlador (sin y con PI)
            % tiempo pico < 0,2
            % sobrepico < 20%
            % Ess 0
clc
z = [-8];
p = [-3 -6 -10];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den)

kp = 1;
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);

FTLA_PI = GcPI * Gp;

figure(1)
    rlocus(FTLA_PI)
    title('LGR - Controlador PI')

%=====Salida del Sistema en LC (PI)=====
FTLC1 = feedback(FTLA_PI, 1);

Ti = 2;
    num = [kp*Ti kp];
    den = [Ti 0];
    GcPI = tf(num, den);
    FTLC2 = feedback(GcPI*Gp, 1);

Ti = 5;
    num = [kp*Ti kp];
    den = [Ti 0];
    GcPI = tf(num, den);
    FTLC3 = feedback(GcPI*Gp, 1);   

figure(2)
    step(FTLC1, FTLC2, FTLC3)
    title('Escalon - Controlador PI')
    legend('Ti=0.5', 'Ti=2', 'Ti=5')
    ylim([0 1.2])

%% Ejercicio 2) con PID
clc
z = [-8];
p = [-3 -6 -10];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den)

kp = 1;
Ti = 0.5;
Td = 0.5;

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);
FTLAPID = GcPID * Gp;

figure(1)
    rlocus(FTLAPID)
    title('LGR - PID')

%=====Salida del Sistema en LC (PID)=====
FTLC1 = feedback(FTLAPID, 1);

Td = 2;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);
    FTLC2 = feedback(GcPID*Gp,1);

Td = 10;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);
    FTLC3 = feedback(GcPID*Gp, 1)

figure(2)
    step(FTLC1, FTLC2, FTLC3)
    title('Escalon - Controlador PID')
    legend('Td=0.5', 'Td=2', 'Td=10')