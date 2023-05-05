%% Metodo 1: Curva de Reaccion del Proceso
clc

num = [1 3];
den = [1 5 9 5];
Gp = tf(num, den)
H = 1   % para calcular el punto de inflexion

dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);    % Punto de inflexion

%----Calculando la derivada----
dC = diff(C)/dt;
d2C = diff(dC)/dt;
%------------------------------

[m, p] = max(dC)    %m=maximo, p=posicion del maximo
tpi = t(p)          % tpi = TiempoPuntoInflexion para la posicion del maximo
Cpi = C(p)          % valor que asume la funcion original en ese tiempo

figure(1)
hold on
    plot(C, 'b')
    plot(dC, 'r')
    plot(d2C, 'g')
    legend('C(t)', 'dC(t)', 'd2C(t)')
    grid
    % cuando dC = 0, hay un maximo, y es donde se da el punto de inflexion

%========PID con: L y T=============
L = 0.2241;     % del ppt
T = 1.9410;     % del ppt
%===================================

%========Parametros=================
kp = 1.2*T/L;
Ti = 2*L;
    ki = kp/ti;
Td = 0.5*L;
    kd = kp*Td;
%===================================

Gc = tf([kd kp ki], [1 0])      % cambia el orden (kp.s + ki + kd.s^2)/s {simplifico}
FTLC = feedback(Gc * Gp, 1)

%=====Mejoramos los parametros======
kp1 = 1.5*kp;   % para acelerar la respuesta
kd1 = 5*kd;     % ayuda a amortiuar, baja el pico
ki1 = ki;       % lo dejamos como esta, porque llegamos a Ess=0

Gc1 = tf([kd1 kp1 ki1], [1 0])
FTLC1 = feedback(Gc1 * Gp, 1)
%===================================

figure(2)
    step(FTLC, FTLC1)
    % FTLC --> overshoot: 48.6% | settling time: 6.13
    % FTLC --> Ess=0, porque la parte integral hace que se elimine el Ess
    title('PID Z-N Curva Reaccion Proceso - Mejora 1');
        % FTLC1 --> se amortigua el sistema y responde mas rapido, mejora mucho
        % FTLC1 --> overshoot: 7.34% | ST: 1.84
