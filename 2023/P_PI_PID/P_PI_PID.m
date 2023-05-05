%% Controlador Proporcional
clc

z = '';
p = [-1 -0.5]; 
H = 1;
[num, den] = zp2tf(z, p, 1);
Gp = tf(num, den);              % FT de la Planta

kp = 1;         
GcP = tf(kp);        % FT del controlador proporcional

FTLA = Gc * Gp;      % Para hacer el LGR

figure(1)
    rlocus(FTLA)
    xlim([-1.5 1]);
    ylim([-3 3]);
    title('LGR Controlador Proporcional');
        % si hablamos de estabilidad, es estable porque esta del lado
        % negativo para cualquier valor de k

%-----Salida del Sistema en Lazo Cerrado-----
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
    title('Controlador Proporcional')
    legend('C(t) 0.5', 'C(t) 3', 'C(t) 5', 'Entrada Escalon')
    % k=0.5 --> el polo se aleja a la izquierda, se estabiliza mas rapido y responde mas rapido
    % a medida que aumento el K oscila, y el sobreimpulso es mas grande

%% Controlador Proporcional (PI)
clc

z = '';
p = [-1 -0.5];
H = 1
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den);

kp = 1;
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);
FTLAPI = GcPI * Gp

figure(1)
    rlocus(FTLAPI)
    xlim([-3 1]);
    ylim([-3 3]);
    title('Control Proporcional (PI)')

% Salidas del Sistema en Lazo Cerrado PI
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);
FTLC1 = feedback(GcPI*Gp, H)

Ti = 2;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);
FTLC2 = feedback(GcPI*Gp, H)

Ti = 5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);
FTLC3 = feedback(GcPI*Gp, H)

figure(2)
    step(FTLC1, 'g', FTLC2, 'b', FTLC3, 'r')
    xlim([-1 10])
    title('Controlador Proporcional Integral (PI)')
    legend('C(t) Ti=0.5', 'C(t) Ti=2', 'C(t) Ti=5', 'Entrada Escalon')

%% Controlador Proporcional Integral Derivativo (PID)
clc

z = '';
p = [-1 -0.5];
H = 1;
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den);

kp = 1;
Ti = 1;
Td = 0.5;

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);
FTLAPID = GcPID * Gp;

figure(1)
    rlocus(FTLAPID)
    xlim([-2 0.5])
    ylim([-1.55 1.5])
    title('Controlador Proporcional Integral Derivativo (PID)')

%-----Salidas del Sistema en Lazo Cerrado PID-----
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

Td = 10;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID3 = tf(num, den);
FTLC3 = feedback(GcPID3*Gp, H);

figure(2)
    step(FTLC1, 'g', FTLC2, 'b',FTLC3, 'r')
    xlim([-1 10]);

hold on;
t = (-1:0.01:10);
unitstep = t>=0;
plot(t, unitstep, 'k')
    title('Controlador Proporcional Integral Derivativo (PID)')
    legend('C(t) Td=0.1', 'C(t) Td=2', 'C(t) Td=10', 'Entrada Escalon')


