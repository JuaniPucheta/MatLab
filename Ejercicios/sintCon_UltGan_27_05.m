% Sintonización de Controladores y Ultima Ganancia27/05

%% Método 1: Curva de Reacción del Proceso

clc

num = [1 3];
den = [1 5 9 5];
Gp = tf(num, den)
H = 1    % para calcular el punto de inflexion

figure(1)
step(Gp*H)

dt = 0.05;
t = 0:dt:8;
C = step(Gp,t);
dC = diff(C)/dt;    % derivada
d2C = diff(dC)/dt;  % derivada segunda

[m,p] = max(dC)
tpi = t(p)          % tiempo de punto de inflexion, se da en el 0.75
Cpi = C(p)          % se da en el 0.1625

L = 0.2241;
T = 1.9418;
kp = 1.2*T/L;
Ti = 2*L
Td = 0.5*L;
ki = kp/Ti;
kd = kp*Td;

Gc = tf([kd kp ki], [1 0])
FTLC = feedback(Gc*Gp, H)

% Mejoramos los parametros (1)
kp1 = 1.5*kp;
kd1 = 3*kd;
ki1 = ki;
Gc = tf([kd1 kp1 ki1], [1 0])
FTLC1 = feedback(Gc*Gp, H)

% Mejoramos los parametros (2)
kp2 = 1.5*kp;
kd2 = 5*kd;
ki2 = ki;
Gc = tf([kd2 kp2 ki2], [1 0])
FTLC2 = feedback(Gc*Gp, H)

figure(2)
plot(C, "b")
hold on
plot(dC, "r")
plot(d2C, "g")
legend('C(t)', 'dC(t)', 'd2C(t)')
axis([0 100 -0.25 1])
grid

figure(3)
step(FTLC, FTLC1, FTLC2)

%% Metodo 2: Método de la última ganancia

p1 = 0;
p2 = -1;
p3 = -2;
z = '';
k = 1;
p = [p1, p2, p3];
[num, den] = zp2tf(z,p,k)
Gp = tf(num, den)
H = 1
FTLA = Gp*H
figure(1)
rlocus(FTLA)
axis([-3 2 -4 4])
