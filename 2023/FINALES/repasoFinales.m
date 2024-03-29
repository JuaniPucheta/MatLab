%% Final 20/10/2020
%% Ejercicio 1 - LGR Proporcional

%--------Planta-----------
z = [-8];
p = [-3 -6 -10];
k = 1;
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);
%-------------------------

%-------Controlador-------
kp = 1;
Gc = tf(kp);
%-------------------------

FTLA = Gp * Gc

figure(1)
    rlocus(FTLA)
    title('LGR Controlador Proporcional')
    % es estable, todo el LGR está a la izq. del eje imaginario

FTLC = feedback(FTLA, 1)

figure(2)
    pzmap(FTLC)
    title('Patron de polos y ceros LC')

%-----Aumentando ganancia k-------
kp1 = 5;
    Gc1 = tf(kp1);
    FTLA = Gp * Gc1;
    FTLC1 = feedback(FTLA, 1);
   
kp2 = 10;
    Gc2 = tf(kp2);
    FTLA = Gp * Gc2;
    FTLC2 = feedback(FTLA, 1);

figure(3)
    step(FTLC, FTLC1, FTLC2)
    title('Escalon - Controlador Proporcional variando k');
    legend('kp = 1', 'kp = 5', 'kp = 10');
    xlabel('Tiempo');
    ylabel('Amplitud')
    % a medida que aumento la ganancia kp, se acerca al setpoint y responde
    % mas rapido. Aumenta tambien el sobreimpulso

%% Ejercicio 2 - Diseño de un mejor sistema PID
% tp < 0,2 || overshoot < 20% || ess = 0


%--------Planta-----------
z = [-8];
p = [-3 -6 -10];
k = 1;
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);
%-------------------------

%------Controladores------
kp = 1;
Ti = 0.5;
num = [kp*Ti kp];
den = [Ti 0];
GcPI = tf(num, den);

FTLA_PI = GcPI * Gp;

figure(1)
    rlocus(FTLA_PI)
    title('LGR Controlador PI')

%------Salida LC---------
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
    legend('Ti = 0.5', 'Ti = 2', 'Ti = 5')
    ylim([0 1.5])
    ylabel('Amplitud')
    xlabel('Tiempo')

%% Ejercicio 2 - PID (no haria falta porque ya con PI esta bien)
%--------Planta-----------
z = [-8];
p = [-3 -6 -10];
k = 1;
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);
%-------------------------

%------Controladores------
kp = 1;
Ti = 0.5;
Td = 0.5
num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);

FTLA_PID = GcPID * Gp;

figure(1)
    rlocus(FTLA_PID)
    title('LGR - PID')

%-----Salida del sistema LC----
FTLC1 = feedback(FTLA_PID, 1);

Td = 2;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);
    FTLC2 = feedback(GcPID*Gp, 1);

Td = 5;
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);
    FTLC3 = feedback(GcPID*Gp, 1);

figure(2)
    step(FTLC1, FTLC2, FTLC3)
    title('Escalon - PID')
    legend('Td = 0.5', 'Td = 2', 'Td = 5')
    ylim([0 1.5])
    ylabel('Amplitud')
    xlabel('Tiempo')


%% Final 13/05/2021
%% Ejercicio B - pzmap
z = '';
k = 1;
p = [i -i];
[num, den] = zp2tf(z,p,k);
FTLA = tf(num, den);

figure(1)
    pzmap(FTLA)
    title('Polos y ceros de FTLA');
    ylabel('Amplitud'); xlabel('Tiempo');
    % se aprecia que los polos se encuentran sobre el eje imaginario, y no
    % hay parte real, es solo compleja. El sistema es criticamente
    % estable, por lo que presenta oscilaciones sostenidas de forma
    % indefinida en su salida

%% Ejercicio C - impulse
z = '';
k = 1;
p = [i -i];
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);

impulse(Gp)
    title('Respuesta Impulso');
    legend('Gp');
    ylabel('Amplitud'); 
    xlabel('Tiempo')
    % la respuesta es rara porque parece ser criticamente estable, no es
    % preciso hacer un estudio ya que no se puede analizar mas que el
    % calculo mismo y la respuesta dada por el impulse(Gp)

%% Ejercicio 3 - G(s)
num = [1];
den = [2 13 20];
G = tf(num, den);

figure(1)
    step(G)
    title('Respuesta Escalon de G');
    ylabel('Amplitud'); xlabel('Tiempo');

figure(2)
    pzmap(G)
    title('Polos y Ceros de G en LA');
    ylabel('Amplitud'); xlabel('Tiempo');
    % p = [-2.5 -4], estan a la izquierda del eje imaginario, por lo tanto
    % es un sistema estable, de fase minima. Ambos polos tienen parte
    % negativa sin parte imaginaria.

%% Final 01/12/2022
%% Ejercicio 1
z = '';
p = [0 -6];
k = 1;
[num, den] = zp2tf(z,p,k);
Gp = tf(num, den);

kp = 1;
Gc = tf(kp);

FTLA = Gp * Gc;

figure(1)
    rlocus(FTLA)
    title('LGR en LA'); ylabel('Amplitud'); xlabel('Tiempo'); legend('FTLA')
    % polos en 0 y -6, punto de desprendimiento en -3
    % sistema de fase minima salvo que hay un polo en -0, lo cual convierte
    % al sistema en criticamente estable

kp = 1;
Ti = 1;
Td = 1;

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
GcPID = tf(num, den);
FTLAPID = GcPID * Gp;

figure(2)
    rlocus(FTLAPID);
    title('LGR Controlador (PID)');

%-----Salidas del Sistema en LC (PID)-----
FTLC1 = feedback(GcPID*Gp, 1);

%-----Mejorando PID------
kp = 14;
Td = 6.5;
Ti = 0.1;   % con 0.1 consigo peak time 0,2
    num = [kp*Td*Ti kp*Ti kp];
    den = [Ti 0];
    GcPID = tf(num, den);  
    FTLC2 = feedback(GcPID*Gp, 1);

figure(3)
    step(FTLC1, FTLC2)
        title('Escalon - Controlador PID')
        legend('PID', 'PID Mejorado')
        xlim([0 70])
        % overshoot 5.36% y tp = 2.38 segundos

%% Final 08/08/2022
num = [1];
den = [4 10];
G = tf(num, den);

figure(1)
    pzmap(G)
    title('Polos y Ceros de la G')
    ylabel('Amplitud'); xlabel('Tiempo'); legend('G')

figure(2)
    step(G)
    title('Escalon para G')
    ylabel('Amplitud'); xlabel('Tiempo'); legend('G(t)'); ylim([0 0.15])

%% Parcial 20/10/2023
num = [4];
den = [1 -1 -3];
Gp = tf(num, den);

figure(1)
    step(Gp)
    ylabel('Amplitud'); xlabel('Tiempo'); legend('FTLC');
    title('Respuesta Escalon');
    % inestable, diverge sin limite

den2 = [1 1 2];
Gp2 = tf(num, den2);

figure(2)
    step(Gp2)
        ylabel('Amplitud'); xlabel('Tiempo'); legend('FTLC 2');
        title('Respuesta Escalon');
        % se estabiliza en y=2, sistema estable con overshoot y una leve
        % oscilacion 

figure(3)
    pzmap(Gp2)
    title('Polos y Ceros de FTLC 2')
