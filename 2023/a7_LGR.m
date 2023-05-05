%% Lugar Geometrico de las Raices
num = [1];
den = [1 2];
FTLA = tf(num, den);

figure(1)
rlocus(FTLA);           % en MatLab, rlocus tiene como parametro FTLA, sin embargo el método trabaja en LC
    % la linea dibujada se llama "Rama"
    % Gain: ganancia k
 
k = 3;      % valor random
num = [k];
den = [1 2+k];
FTLC = tf(num, den)

k = 32;
num = [k];
den = [1 2+k];
FTLC1 = tf(num, den)

k = 35;
num = [k];
den = [1 2+k];
FTLC2 = tf(num, den)

figure(2)
step(FTLC, FTLC1, FTLC2)
    % mientras mas grande sea el K, mas negativo es el polo y mas rapida va
        % a ser la respuesta, y disminuye el Ess

%% Lugar Geometrico de las Raices - Otra funcion 
num = [1];
den = [1 1 0];
FTLA = tf(num, den);

figure(1)
rlocus(FTLA);          
    % k > 1/4 --> eje Y (parte Imaginaria), subamortiguado, oscila
    % k = 1/4 --> criticamente amortig, es la mejor rta antes que el
        % sistema oscile, es decir que se vuelva subamort.
    % k < 1/4 --> sobreamortiguado
 
k = 0.05;
num = [k];
den = [1 1 k];
FTLC = tf(num, den)

k = 0.25;
num = [k];
den = [1 1 k];
FTLC1 = tf(num, den)

k = 10;
num = [k];
den = [1 1 k];
FTLC2 = tf(num, den)

figure(2)
step(FTLC, FTLC1, FTLC2)
    xlim([0 30])
    % 0.05 sobreamortiguado
    % 0.25 criticamente amort.
    % 10 subamortiguado, overshoot 60% (es muy grande), presenta oscilaciones