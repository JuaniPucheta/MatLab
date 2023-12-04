%% SINTONIZACION - Curva de Reaccion del Proceso PID
num = [1];
den = [1 9 26 24];
Gp = tf(num, den);

%----step de Gp con t-------
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);
%---------------------------

figure(1);
plot(t, C, '-b');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t) - Exacta');

%----Punto de Inflexion----
dC = diff(C)/dt;
d2C = diff(dC)/dt;
%--------------------------

figure(2)
hold on
plot(C, '-b')
plot(dC, '-r')
plot(d2C, '-g')
    legend('C(t)', 'dC(t)', 'd2C(t)')
    grid
    axis([0 70 -0.04 0.1])

[m, p] = max(dC)    % CONSOLA m=0.0312
tpi = t(p)      % CONSOLA da 0.65 (x), entonces en la GRAFICA lo marco con punto y me fijo el valor de Y=0.01167
    % y = m*x + h
    % 0.01167 = 0.0312*0.65 + h 
                            % h = (-0.00858)
L = 0.275;
    % L=-ord/m --> 0.00858/0.0312
T = 1.3356;
    % AL=G(0) --> 0.04167 = 0.0312.T - 0.00858 --> T=1.6101 --> Ti = T-L = 1.33556
        % GRAFICA 0.04167 es el valor donde se estabiliza (grafica linea 13)
    % el valor de Ti es el que pongo en matlab como T

%-----Tabla amarilla--------
kp = (1.2*T/L);
Ti = 2*L;
Td = 0.5*L;
%-----------------------

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
figure(3)
hold on; 
step(FTLC, '-b');

%------Mejorando los parametros (1)-------
kp1 = 1.5*kp;
Td1 = 3*Td;

num = [kp1*Td1*Ti kp1*Ti kp1];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-r');
    legend('PID Z-N', 'PID mejorado');
%------------------------------------

%------Mejorando los parametros (2)-------
kp1 = 1.5*kp;
Td2 = 5*Td;

num = [kp1*Td2*Ti kp1*Ti kp1];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-g');
    legend('PID Z-N', 'PID mejorado1', 'PID mejorado2');
%------------------------------------

%------Mejorando los parametros (3)-------
kp2 = 1.5*kp;
Td3 = 4*Td;

num = [kp2*Td3*Ti kp2*Ti kp2];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-r');
    legend('PID Z-N', 'PID mejorado1', 'PID mejorado2', 'PID mejorado3');
%------------------------------------

