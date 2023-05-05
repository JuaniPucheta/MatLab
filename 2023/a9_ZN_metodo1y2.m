%% Metodo 1: Curva de Reaccion del Proceso
clc

num = [1 3];
den = [1 5 9 5];
Gp = tf(num, den);

dt = 0.05;
t = 0:dt:8;
C = step(Gp,t);

%----calculando la derivada---
dC = diff(C)/dt;
d2C = diff(dC)/dt;
%-----------------------------

[m, p] = max(dC)             % m=maximo, p=posicion del máximo
tpi = t(p)                   % tpi=TiempoPuntoInflexion para la posición del máximo
Cpi= C(p)                    % valor que asume la funcion orginial en ese tiempo

figure(1)
hold on
plot(C, 'b')
plot(dC, 'r')
plot(d2C, 'g')
    legend('C(t)', 'dC(t)', 'd2C(t)')
    axis([0 100 -0.25 1])
    grid
    % cuando dC=0, hay un maximo, y es donde se da el pto de inflexion

%=========PID con: L y T===============
L = 0.2241;     % del ppt
T = 1.9410;     % del ppt
%------------------------
Kp = 1.2*T/L;
Ti = 2*L;
    Ki = Kp/Ti;
Td = 0.5*L;
    Kd = Kp*Td;
%------------------------
Gc = tf([Kd Kp Ki], [1 0])          % cambia el orden (kp.s + ki + kd.s^2)/s {simplifico}
FTLC = feedback(Gc * Gp, 1)
%======================================

%=====Mejoramos los parametros=========
Kp1 = 1.5*Kp;    % para acelerar la respuesta
Kd1 = 5*Kd ;     % ayuda a amortiguar, baja  el pico
Ki1 = Ki;        % lo dejamos como esta, porque llegamos a Ess=0
Gc1 = tf([Kd1 Kp1 Ki1], [1 0])         
FTLC1 = feedback(Gc1 * Gp, 1)
%======================================

figure(2)
step(FTLC, FTLC1)
    %FTLC --> overshoot: 48.6% | settling time: 6.13
    %FTLC --> Ess=0, porque la parte integral hace que se elimine el Ess 
    title('PID Z-N Curva Reaccion Proceso - Mejora 1');
        %FTLC1 --> se amortigua el sistema y responde mas rapido, mejora mucho
        %FTLC1 --> overshoot: 7.34% | ST: 1.84
      
%% Metodo 2: Metodo de la Ultima Ganancia

p1 = 0;
p2 = 1;
p3 = 2;
    p = [-p1 -p2 -p3];
z = ''; 
k = 1; 

[num, den] = zp2tf(z, p, k)
Gp = tf(num, den)

Kp = 1;
Gc = tf(Kp);

FTLA = Gc * Gp

figure(1)
rlocus(FTLA)
    axis([-3 2 -4 4])
    % el valor de K lo veo en el Eje Y antes de cruzar
    % el LGR cruza el eje imaginario, asi que voy a encontrar K critico

