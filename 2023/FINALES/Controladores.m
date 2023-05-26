%% LGR y Escalon - Controlador Proporcional
% https://www.youtube.com/watch?v=zCy5GptcoEg&list=PLJe-kmBlq36vozQlHX-VuKr42iVf78qyM&index=13
clc
z = '';
p = [-1 -0.5]
[num, den] = zp2tf(z, p, 1);
Gp = tf(num, den);

kp = 1;
GcP = tf(kp);

FTLA = GcP * Gp;

figure(1)
    rlocus(FTLA)
    xlim([-1.5 1]);
    ylim([-3 3]);
    title('LGR Controlador Proporcional')
        % si hablamos de estabilidad, es estable porque esta del lado
        % negativo para cualquier valor de k
      
%-----Salida del Sistema en LC (P)-----
kp = 1;
    GcP = tf(kp);
    FTLC1 = feedback(GcP*Gp, 1)

kp = 3;
    GcP = tf(kp);
    FTLC2 = feedback(GcP*Gp, 1)

kp = 5;
    GcP = tf(kp);
    FTLC3 = feedback(GcP*Gp, 1)

figure(2)
step(FTLC1, FTLC2, FTLC3)
    title("Escalon - Controlador Proporcional")
    legend('kp = 1', 'kp = 3','kp = 5')
    % a medida que el polo se va mas a la izquierda (k aumenta) se
        % estabiliza mas rapido y responde mas rapido
    % a medida que aumento el k oscila, y el sobreimpulso es mas grande

%% LGR y Escalon - Controlador Proporcional (PI)
clc
z = '';
p = [-1 -0.5];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den)

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
    title('LGR Controlador Proprocional Integral')

%-----Salidas del Sistema en LC (PI)-----
FTLC1 = feedback(GcPI*Gp, 1);

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
    step(FTLC1, FTLC2, FTLC3);
    xlim([-1 10]);
    title('Escalon - Controlador PI')
    legend('Ti = 0.5', 'Ti = 2', 'Ti = 5')

%% LGR y Escalon - Controlador PID
clc
z = '';
p = [-1 -0.5];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den)

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
    title('LGR Controlador (PID)')

%-----Salidas del Sistema en LC (PID)-----
FTLC1 = feedback(GcPID*Gp, 1);

Td = 2;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);  
    FTLC2 = feedback(GcPID*Gp, 1);

Td = 10;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);  
    FTLC3 = feedback(GcPID*Gp, 1);

figure(2)
    step(FTLC1, FTLC2, FTLC3)
    xlim([-1 10])
hold on;
t = (-1:0.01:10);
unitstep = t>=0;
    plot(t, unitstep, 'k')
        title('Escalon - Controlador PID')
        legend('Td = 0.5', 'Td = 2', 'Td = 10')


