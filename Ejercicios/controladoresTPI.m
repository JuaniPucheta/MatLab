%========================================================
%% Controlador P
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
%------------------------------------------

FTLC1 = feedback(PLANTA, H)   

step(FTLC1, 'g')
title('Controlador Proporcional (P)')
ylim([-0.1 0.5])
legend('C(t) para kp=0.5', 'Entrada Escalon')
xlabel('Tiempo')
ylabel('Amplitud')

%========================================================
%% Controlador P variando k
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
FTLC1 = feedback(PLANTA, H)   
%------------------------------------------

% Variacion K=0.6 -----------------------------
k = 0.75;
num= [k];
den = [T1 1];
G = tf(num,den)
PLANTA = G*R
FTLC2 = feedback(PLANTA, H)  

% Variacion K=0.7 -----------------------------
k = 1;
num= [k];
den = [T1 1];
G = tf(num,den)
PLANTA = G*R
FTLC3 = feedback(PLANTA, H)  

step(FTLC1, 'g',FTLC2, 'b',FTLC3, 'r')
title('Controlador Proporcional (P)')
legend('C(t) para kp=0.5', 'C(t) para kp=0.75', 'C(t) para kp=1', 'Entrada Escalon')
xlabel('Tiempo')
ylabel('Amplitud')

%========================================================
%% Controlador PI 
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
Ti = 0.3;         % tiempo INTEGRAL
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
%------------------------------------------

% Integral --------------------------------
numI = [k*Ti k];
denI = [Ti 0];
GcPI = tf(numI,denI); 
FTLAPI = PLANTA * GcPI;
FTLC = feedback(FTLAPI, H)
%------------------------------------------

step(FTLC, 'r')
title('Controlador Proporcional Integral (PI)')
legend('C(t) para Ti=0.3', 'Entrada Escalon')
xlim([0 30])
xlabel('Tiempo')
ylabel('Amplitud')
ylim([-0.2 1.7])

%========================================================
%% Controlador PI variando Ti
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
Ti = 0.3;         % tiempo INTEGRAL
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
%------------------------------------------

% Integral --------------------------------
numI = [k*Ti k];
denI = [Ti 0];
GcPI = tf(numI,denI); 
FTLAPI = PLANTA * GcPI;
FTLC1 = feedback(FTLAPI, H)
%------------------------------------------

% Variacion Ti=0.5 -----------------------------
Ti = 0.5;
numI = [k*Ti k];
denI = [Ti 0];
GcPI = tf(numI,denI); 
FTLAPI = PLANTA * GcPI;
FTLC2 = feedback(FTLAPI, H) 

% Variacion Ti=0.75 -----------------------------
Ti = 0.75;
numI = [k*Ti k];
denI = [Ti 0];
GcPI = tf(numI,denI); 
FTLAPI = PLANTA * GcPI;
FTLC3 = feedback(FTLAPI, H) 

step(FTLC1, 'g',FTLC2, 'b',FTLC3, 'r')
title('Controlador Proporcional Integral (PI)')
legend('C(t) para Ti=0.3', 'C(t) para Ti=0.5', 'C(t) para Ti=0.75', 'Entrada Escalon')
xlabel('Tiempo')
ylabel('Amplitud')

%========================================================
%% Controlador PD (Hacer el denD)
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
TaoD = 0.2;         % tiempo DERIVATIVO
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
%------------------------------------------
 
% Derivativo  --------------------------------
numD = [k*TaoD k]; 
denD = []; 
GcPD = tf(numD, denD); 
FTLAPD = PLANTA * GcPD;
%------------------------------------------

FTLC = feedback(FTLAPD, H);
step(FTLC, 'g')
title('Controlador Proporcional Derivativo (PD)'); 
xlabel('Tiempo'); 
ylabel('Amplitud');

%========================================================
%% Controlador PID
%========================================================
clc

% PARAMETROS ------------------------------
k = 0.5           % tomamos k y kp iguales
T1 = 0.5          % cte de tiempo
Td = 1.1          % tiempo de retardo
TaoD = 0.2;       % tiempo DERIVATIVO   (>0.3 empieza a deformarse)
Ti = 0.3;         % tiempo INTEGRAL
H = 1;            % unitario
%------------------------------------------

% PLANTA ------------------------------
num= [k];
den = [T1 1];
G = tf(num,den);
R = exp(tf([-Td 0], 1));
PLANTA = G*R
%------------------------------------------

% PID  --------------------------------
numPID = [k*TaoD*Ti k*Ti k]; 
denPID = [Ti 0]; 
GcPID = tf(numPID, denPID); 
FTLAPID = PLANTA * GcPID;
%------------------------------------------

FTLC = feedback(FTLAPID, H);

step(FTLC, 'b')
title('Controlador Proporcional Integral Derivativo (PID)'); 
legend('C(t) para TaoD= y Ti=0.3', 'Entrada Escalon')
xlim([0 15]) 
xlabel('Tiempo'); 
ylabel('Amplitud');
