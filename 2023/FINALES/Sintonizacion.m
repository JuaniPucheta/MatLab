%% 1. Curva Reaccion PID
num = [1 3];
den = [1 5 9 5];
Gp = tf(num, den);

%========step===========
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);

figure(1)
    plot(t, C)
    xlabel('Tiempo'); ylabel('Amplitud');
    legend('C(t) - Exacta')
    ylim([0 0.8])
    grid
%=======================

%======Punto de Inflexion=======
dC = diff(C)/dt;
d2C = diff(dC)/dt;

figure(2)
hold on
    plot(C); plot(dC); plot(d2C)
    legend('C(t)', 'dC(t)', 'd2C(t)')
    grid
    axis([1 40 -0.4 1])
%===============================

%=======Obtencion valores=======
[m, p] = max(dC)    % CONSOLA m=0.309
Cpi = C(p)      % CONSOLA esto es el Y
tpi = t(p)      % CONSOLA da 0.75 (x)
    % Cpi = m*tpi + h --> Y = m*x + h
    % 0.01625 = 0.309*0.75 + h 
                            % h = (-0.06925)
L = 0.2241;
    % L=-h/m --> 0.06925/0.309
T = 1.94;
    % Y estabiliza de 'C(t) exacta' --> 0.5996
    % ==>(Y=m*T-h) --> 0.5996 = 0.309*T - 0.06925
    % despejo T --> T=2.16456 --> Ti = T-L = 1.94
%===============================

%=========Tabla amarilla========
kp = 1.2*T/L;
Ti = 2*L;
    ki = kp/Ti;
Td = 0.5*L;
    kd = kp*Td;
%===============================

num = [kd kp ki];
den = [1 0];
GcPID = tf(num, den);
FTLC = feedback(GcPID*Gp, 1);

figure(3)
    step(FTLC)
        % overshoot 48.6% | ts 6.13 | Ess=0

%=======Mejorando parametros=====
kp1 = 1.5*kp;   % acelera la respuesta  
kd1 = 5*kd;     % baja el overshoot
num = [kd1 kp1 ki];
den = [1 0];
GcPID_mejorado = tf(num, den)
FTLC_mejorado = feedback(GcPID_mejorado*Gp, 1)

figure(4)
    step(FTLC, FTLC_mejorado)
        % mejorado: overshoot 7.34% | ts 1.84
%================================

%=======Mejorando parametros 2=====
kp2 = 1.5*kp1;   
kd2 = 5*kd1;     
num = [kd2 kp2 ki];
den = [1 0];
GcPID_mejorado2 = tf(num, den)
FTLC_mejorado2 = feedback(GcPID_mejorado2*Gp, 1)

figure(5)
    step(FTLC_mejorado, FTLC_mejorado2)
        % mejorado2: overshoot 1.53% | ts 1.6 
%================================





