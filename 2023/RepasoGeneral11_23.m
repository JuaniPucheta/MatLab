%% Primer Orden
clc
hold on % para que aparezcan las 2 funciones graficadas
        % si quisiese hacer step(G1) step(G2)

% Cuando son comandos irrelevantes, ponemos ; al final, para que no lo
% muestre en la Commad Window
T1 = 0.1;
T2 = 0.2;

num = [1];
den = [T1 1];
G1 = tf(num, den)

num = [1];
den = [T2 1];
G2 = tf(num, den)

step(G1, G2)
title('Respuesta al Escalon - Sistema de Primer Orden')
xlabel('Amplitud')
ylabel('Tiempo')
ylim([0 1.2])
legend('C1(t) Tau 0.1', 'C2(t) Tau 0.2')
    % C1 responde de manera mas rapida y se estabiliza antes que C2
    % Mas chico es el Tau => mas rapido responde el sistema
    % Mas grande (eje izquierda) es el polo => mas rapido responde el sistema
    % en Tau=1 alcanza el 63,2% de la respuesta final

%% Funcion Senoidal 1er Orden
t = 0:0.1:10;
u = 5*sin(t);   % es la entrada
num = [1];
den = [5 1];
G = tf(num, den)

% Defino entrada senoidal
lsim(G,u,t)
    % está desfasada y atenuada
    % la amplitud es menor, tiene la misma frecuencia
title('Respuesta SPO entrada senoidal');
xlabel('Tiempo');
ylabel('Amplitud');

%% Sobreamortiguados
clc

z = '';     % estamos aclarando que no tenemos ceros, entonces ponemos null
p1 = 1;     % polo
p2 = 2;

% Sistema de 1er Orden
k = p1;
p = [-p1];
[num, den] = zp2tf(z,p,k);
GPO = tf(num, den)  % arranca respondiendo mas rapido

% Sistema de 2do Orden
p = [-p1, -p2];     % definimos los polos
k = p1*p2;          % es el producto de las constantes
[num, den] = zp2tf(z,p,k);
GSA = tf(num, den)  %Gsistema SobreAmortiguado

% Otra FT de 2do Orden
p2 = 50;
p = [-p1, -p2];     
k = p1*p2;          
[num, den] = zp2tf(z,p,k);
GSA1 = tf(num, den)

step(GSA, GPO, GSA1)
    legend('GSA', 'GPO', 'GSA1')
    % GSA arranca como si fuese una parabola.
        % GPO inmediatamente sufre un cambio y el sistema empieza a responder,
        % GSA no, y se toma un tiempo. Esa es la diferencia.
    % GSA1 es muy parecida a GPO: a medida que alejamos el 2do polo del eje
        % imaginario, hacia la izquieda, el sistema se aproxima mas a un
        % sistema de 1er Orden. Mientras más esté alejado del sistema
        % imaginario, menos influye en la salida del sistema.
    % 1er Orden la velocidad de respuesta es más rápida. Inmediatamente
        % sufre un un cambio y responde
        % 2do Orden no, se toma un tiempo

%% SubAmortiguados (variando parte REAL)
clc
z = '';

p1 = 0.2+3i;
p2 = 0.2-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA1 = tf(num, den)

p1 = 0.8+3i;
p2 = 0.8-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA2 = tf(num, den)

p1 = 1.7+3i;
p2 = 1.7-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA3 = tf(num, den)

step(GSubA1, GSubA2, GSubA3)
    % GSubA1 => la salida oscila, y va disminuyendo
        % overshoot: pico máximo (cuánto se pasa la salida del valor en el
            % cual se estabiliza, cuánto se pasa en porcentaje del valor final)
    % oscila menos cuando más grande es Sigma, las oscilaciones son más suaves
    % todas tienen la misma frecuencia
title('Respuesta al Escalón - varía parte real de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('GSubA1(t) Sigma = 0.2', 'GSubA2(t) Sigma = 0.8', 'GSubA3(t) Sigma = 1.7')

%% SubAmortiguado (variando parte IMAGINARIA)
clc
z = '';

p1 = 1+2i;
p2 = 1-2i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA1 = tf(num, den)

p1 = 1+3i;
p2 = 1-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA2 = tf(num, den)

p1 = 1+4i;
p2 = 1-4i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA3 = tf(num, den)

step(GSubA1, GSubA2, GSubA3)
    % cambia la frecuenncia de oscilacion
    % la envolvente exponencial es la misma
    % es mas oscilatorio, y tarda más en estabilizarse
title('Respuesta al Escal[on - varía parte imaginaria de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('GSubA1(t) Wd = 2', 'GSubA2(t) Wd = 3', 'GSubA3(t) Wd = 4')

%% Criterio de Routh (inestable)
clc 

num = [1];
den = [1 2 3 4 5];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 20])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('C(t)')
    % se genera una salida inestable

figure(2)
pzmap(FTLC)
    % tenemos polos inestables a la derecha del eje Imag.

%% Criterio de Routh (criticamente estable)
clc

num = [1];
den = [1 2 1 2];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 30])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('C(t)')
    % se genera una salida criticamente estable
        % oscila indefinidamente

figure(2)
pzmap(FTLC)
    % tenemos polos sobre el eje Imag. (salida oscilante)

%% Criterio de Routh (inestable 2)
clc

num = [1];
den = [1 2 24 48 -25 -50];
FTLC = tf(num, den)

figure(1)
impulse(FTLC);
    xlim([0 10])
    ylim([-2 2])
    title('Respuesta del sistema a una entrada Impulso')
    ylabel('Amplitud')
    xlabel('C(t)')
    % se genera una salida inestable

figure(2)
pzmap(FTLC)
    % tenemos un polo a la derecha del eje Imag.

%% Problema Servo
clc
num = [18];
den = [1 2 26];
FTLC = tf(num, den);

figure(1)
hold on

step(FTLC, 'b');
    t = -1:0.01:7;  % tiempo donde va a estar definida (0.01 es el incremento)
unitstep = t >= 0;  % funcion escalon
    plot(t, unitstep, '-r');
 
title('Respuesta a una entrada Escalon - Problema Servo');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t)', 'Entrada Escalon');
    xlim([-1 7]);
    ylim([0 1.5]);
    % steady state 0.692 => valor donde se estabiliza
    % Ess => diferencia entre escalon y donde se estabiliza el sistema
stepinfo(FTLC) % me da los valores del Caracteristics de la grafica

%% Lugar Geometrico de las Raices LGR
num = [1];
den = [1 2];
FTLA = tf(num, den);

figure(1)
rlocus(FTLA);   % en MatLab, rlocus tiene como parámetro FTLA, 
                % sin embargo el método trabaja con LC
    % la linea dibujada se llama "Rama"
    % Gain => ganancia k

k = 3;          % valor random
num = [k];
den = [1 2+k];
FTLC = tf(num, den)

k = 35;          % valor random
num = [k];
den = [1 2+k];
FTLC2 = tf(num, den)

figure(2)
step(FTLA, FTLC, FTLC2)
    legend('FTLA', 'FTLC', 'FTLA1')
    % mientras más grande sea el K, más negativo es el polo y más rápida
        % va a ser la respuesta, y disminuye el ESS

%% Lugar Geométrico de las Raíces LGR - otra función
clc
num = [1];
den = [1 1 0];
FTLA = tf(num, den);

figure(1)
rlocus(FTLA);
    % k > 1/4 --> eje Y (parte Imag.), subamortiguado, oscila
    % k = 1/4 --> criticamente amortig, es la mejor Rta antes que el
        % sistema oscile, es decir que se vuelva subamortiguado.
    % k < 1/4 --> sobreamortiguado

k = 0.05;
num = [k];
den = [1 1 k];
FTLC = tf(num, den)

k = 0.25;
num = [k];
den = [1 1 k];
FTLC2 = tf(num, den)

figure(2)
step(FTLA, FTLC, FTLC2)
    legend('FTLA', 'FTLC', 'FTLC2')
    xlim([0 15])
    ylim([-1 3])
    % 0.05 sobreamortiguado
    % 0.25 criticamente amort.
    % 10 subamortiguado, overshoot 60% (es muy grande), presenta oscilaciones
stepinfo(FTLC)

%% Controlador proporcional
clc

z = '';
p = [-1 -0.5];
H = 1;                      % realimentacion unitaria
[num, den] = zp2tf(z,p,1)
Gp = tf(num, den)           % FT de la planta

kp = 1;
Gc = tf(kp);                % FT del controlador proporcional

FTLA = Gc * Gp;             % Para hacer el LG debajo

figure(1)
rlocus(FTLA)
    xlim([-1.5 1]);
    ylim([-3 3]);
    title('LGR Control Proporcional')
        % Si hablamos de estabilidad, es estable porque está del lado
            % negativo para cualquier valor de k

% Salida del Sistema en Lazo Cerrado
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
    legend('FTLC1', 'FTLC2', 'FTLC2')
    % k = 0.5 --> el polo se aleja a la izquierda, se estabiliza más rápido
        % y responde más rápido
    % a medida que aumento el K oscila, y el sobreimpulso es más grande


%% Metodo 1: Curva de Reaccion del Proceso PID
clc

num = [1 3];
den = [1 5 9 5];
Gp = tf(num, den);

%========step=========
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);

figure(1)
    plot(t, C);
    xlabel('Tiempo'); ylabel('Amplitud');
    legend('C(t) - Exacta')
    ylim([0 0.8])
    grid
%=====================

%======Punto de Inflexion=====
dC = diff(C)/dt;
d2C = diff(dC)/dt;

figure(2)
hold on
    plot(C); plot(dC); plot(d2C)
    legend('C(t)', 'dC(t)', 'd2C(t)')
    grid
    axis([1 40 -0.4 1])
%=============================

%=======Obtencion valores=====
[m, p] = max(dC)    % CONSOLA m = 0.309
Cpi = C(p)          % CONSOLA esto es el Y
tpi = t(p)          % CONSOLA da 0.75 (x)
    % Cpi = m*tpi + h --> Y = m*x + h
    % 0.01625 = 0.309 * 0.75 + h
                             % h = -0.06925
L = 0.2241;
    % L = -h/m --> 0.06925 / 0.309
T = 1.94
    % Y estabiliza de 'C(t) exacta' --> 0.5996
    % ==> (Y = m*T - h) --> 0.5996 = 0.309 * T - 0.06925
    % despejo T --> T = 2.16456 --> Ti = T - L = 1.94
%=============================

%=======Tabla amarila=========
kp = 1.2 * T/L;
Ti = 2 * L;
    ki = kp/Ti;
Td = 0.5 * L;
    kd = kp*Td;
%=============================

num = [kd kp ki];
den = [1 0];
GcPID = tf(num, den);
FTLC = feedback(GcPID * Gp, 1);

figure(3)
step(FTLC)
    % overshoot 48.6% | ts 6.13 | Ess = 0

%======Mejorando parametros=====
kp1 = 1.5 * kp;     % acelera la respuesta
kd1 = 5 * kd;       % baja el overshoot
num = [kd1 kp1 ki];
den = [1 0];
GcPID_mejorado = tf(num, den)
FTLC_mejorado = feedback(GcPID_mejorado * Gp, 1)

figure(4)
step(FTLC, FTLC_mejorado)
    % mejorado: overshoot 7.34% | ts 1.84
%===============================

%=====Mejorando parametros 2====
kp2 = 1.5 * kp1;
kd2 = 5 * kd1;
num = [kd2 kp2 ki];
den = [1 0];
GcPID_mejorado2 = tf(num, den);
FTLC_mejorado2 = feedback(GcPID_mejorado2 * Gp, 1)

figure(5)
step(FTLC_mejorado, FTLC_mejorado2)
    % mejorado2> overshoot 1.53% | ts 1.6
%===============================

%% Sintonizacion - Curva de Reaccion del proceso PID 2
num = [1];
den = [1 9 26 24];
Gp = tf(num, den);

%----step-------
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);
%---------------

figure(1)
plot(t, C, '-b')
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t) - Exacta')

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

[m, p] = max(dC)    % CONSOLA m = 0.0312
tpi = t(p)          % CONSOLA da 0.65 (x),, entonces en la GRAFICA lo marco con punto y me fijo el valor de Y = 0.1167
    % y = m*x + h
    % 0.01167 = 0.0312*0.65 + h
                            % h = -0.00858
L = 0.275;
    % L = -ord/m --> 0.00858/0.0312
T = 1.3356;
    % AL = G(0) --> 0.04167  = 0.0312.T - 0.00858 --> T = 1.6101 --> Ti = T - L = 1.33556
        % GRAFICA 0.04167 es el valor donde se estabiliza (grfica plot(t,C,'-b-))
    % el valor de Ti es el pongo en MatLab como T

%-----Tabla amarilla------
kp = 1.2 * T/L;
Ti = 2 * L;
Td = 0.5 * L;
%-------------------------

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
Gc = tf(num, den)

FTLC = feedback(Gc*Gp, 1);

figure(3)
hold on
step(FTLC, '-b');

%------Mejorando los parametros (1)-----
kp1 = 1.5 * kp;
Td1 = 3 * Td;

num = [kp1*Td1*Ti kp1*Ti kp1];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-r');
    legend('PID Z-N', 'PID Mejorado')
%---------------------------------------

%------Mejorando los parametros (2)-----
kp1 = 1.5 * kp;
Td2 = 3 * Td1;

num = [kp1*Td2*Ti kp1*Ti kp1];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-r');
    legend('PID Z-N', 'PID Mejorado 1', 'PID Mejorado 2')
%---------------------------------------

%------Mejorando los parametros (3)-----
kp2 = 1.5 * kp;
Td3 = 3 * Td2;

num = [kp2*Td3*Ti kp2*Ti kp2];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gc*Gp, 1);
step(FTLC, '-r');
    legend('PID Z-N', 'PID Mejorado 1', 'PID Mejorado 2', 'PID Mejorado 3')
%---------------------------------------

%% Metodo 2: Método de la Ultima Ganancia

p1 = 0; p2 = 1; p3 = 2;
    p = [-p1 -p2 -p3]

z = '';
k = 1;

[num, den] = zp2tf(z,p,k)
Gp = tf(num, den)

kp = 1;
Gc = tf(kp);

FTLA = Gp * Gc

figure(1)
rlocus(FTLA)
    axis([-3 2 -4 4])
    % el valor de K lo veo en el Eje Y antes de cruzar
    % el LGR cruza el eje Imag., así que voy a encontrar K crítico
    
%% Nyquist - sistema estable con k = 1
k = 1;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);

figure(1)
nyquist(FTLA);      % trabaja con FTLA
    % no hay rodeos al (-1;0)
    % es estable si no hubiera polos a la derecha

figure(2)
pzmap(FTLA)
    % es de fase mínima (está todo a la izquierda)
    % ahora sí podemos decir que es estable

num = [1 2];
den = [1 4 6 5 2];
FTLC = tf(num, den);

figure(3)
step(FTLC)

figure(4)
rlocus(FTLA)
    % para determinar en qué valor de K el sistema se vuelve
    % k > 4 --> inestable

%% Nyquist - sistema inestable con k = 10
k = 10;
num = k;
den = [1 4 6 5 2];
FTLA = tf(num, den);

figure(1)
nyquist(FTLA)   
    % hay 2 rodeos enn el (-1;0)

figure(2)
pzmap(FTLA)

num = [10 20];
den = [1 4 6 5 12];
FTLC = tf(num, den);

figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)
    % hay 2 polos a la derecha del eje Imag., el sistema es inestable

%% Nyquist - sistema criticamente estable con k = 3.9375
k = 3.9375;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);

figure(1)
nyquist(FTLA)
    % cae justo en (-1;0), lo hace criticamente estable

figure(2)
pzmap(FTLA)

num = [k 2*k];
den = [1 4 6 5 2+k];
FTLC = tf(num, den);

figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)
    % tenemos 2 polos en LC sobre el eje Imag., oscila de manera indefinida
    % aun asi, es de fase mínima

%% Ejercicio 32 - Metodo CRP (con zp2tf())
z = '';
k = 1;
p = [-2 -3 -4];
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);

%-----step------
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);
%---------------

figure(1)
    plot(t, C, '-b');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t) - Exacta');