%% Controlador Proporcional - 20/05
clc
z = [''];
p = [-1 -0.5];
[num, den] = zp2tf(z,p,1);     %obtenemos el num y den de la FT
Gp = tf(num,den)
H = 1;  %sistema de realimentacion unitaria

kp = 1;
GcP = tf(kp);    %graficar el lugar geometrico (P es de proporcional)
FTLAP = GcP * Gp

% rlocus (LGR Metodo en Lazo Cerrado - En MatLab la funcion rlocus tiene
% como parámetro la FTLA)

figure(1)
rlocus(FTLAP)
xlim([-1.5 1])
ylim([-3 3])
title('LGR Control Proporcional (P)')

% Salidas del Sistema en Lazo Cerrado
figure(2)
kp = 0.5;
GcP = tf(kp);
FTLC1 = feedback(GcP * Gp, H)    % C1 es caso 1
kp = 3;
GcP = tf(kp);
FTLC2 = feedback(GcP * Gp, H)  
kp = 5;
GcP = tf(kp);
FTLC3 = feedback(GcP * Gp, H)  

step(FTLC1, 'g',FTLC2, 'b',FTLC3, 'r')
xlim([-1 10])

hold on
t = (-1:0.01:10);
unitstep = t >= 0;
plot(t, unitstep, 'k')
title('Controlador Proporcional (P)')
legend('C(t) para kp=0.5', 'C(t) para kp=3', 'C(t) para kp=5', 'Entrada Escalon')

%% Controlador Proporcional (PI)
clc
z = [''];
p = [-1 -0.5];
[num, den] = zp2tf(z,p,1);     
Gp = tf(num,den)
H = 1;  

kp = 1;
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num,den);    
FTLAPI = GcPI * Gp

figure(1)
rlocus(FTLAPI)
xlim([-3 1])
ylim([-3 3])
title('Control Proporcional (PI)')

% Salidas del Sistema en Lazo Cerrado PI
figure(2)
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num,den); 
FTLC1 = feedback(GcPI * Gp, H)    % C1 es caso 1
Ti = 2;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num,den); 
FTLC2 = feedback(GcPI * Gp, H)  
Ti = 5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num,den); 
FTLC3 = feedback(GcPI * Gp, H)  

step(FTLC1, 'g',FTLC2, 'b',FTLC3, 'r')
xlim([-1 10])

hold on
t = (-1:0.01:30);
unitstep = t >= 0;
plot(t, unitstep, 'k')
title('Controlador Proporcional Integral (PI)')
legend('C(t) para Ti=0.5', 'C(t) para Ti=2', 'C(t) para Ti=5', 'Entrada Escalon')

%% Controlador Proporcional Integral Derivativo (PID)
clc
z = [''];
p = [-1 -0.5];
[num, den] = zp2tf(z,p,1);     
Gp = tf(num,den)
H = 1;  

kp = 1;
Ti = 1;
Td = 0.5;

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num,den);    
FTLAPID = GcPID * Gp

figure(1)
rlocus(FTLAPID)
xlim([-2 0.5])
ylim([-1.5 1.5])
title('Control Proporcional Integral Derivativo (PID)')

% Salidas del Sistema en Lazo Cerrado PID
figure(2)
Td = 0.1;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num,den); 
FTLC1 = feedback(GcPID * Gp, H)    
Td = 2;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num,den); 
FTLC1 = feedback(GcPID * Gp, H) 
Td = 10;
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num,den); 
FTLC1 = feedback(GcPID * Gp, H) 

step(FTLC1, 'g',FTLC2, 'b',FTLC3, 'r')
xlim([-1 10])

hold on
t = (-1:0.01:20);
unitstep = t >= 0;
plot(t, unitstep, 'k')
title('Controlador Proporcional Integral Derivativo (PID)')
legend('C(t) para Td=0.1', 'C(t) para Td=2', 'C(t) para Td=10', 'Entrada Escalon')
