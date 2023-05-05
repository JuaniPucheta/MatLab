%% Sistema Estable con k=1
k = 1;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);
figure(1)
nyquist(FTLA);          % trabaja con FTLA
    % no hay rodeos al (-1;0)
    % es estable si no hubiera polos a la derecha para FTLA

figure(2)
pzmap(FTLA);
    % es de fase minima (esta todo a la izquierda)
    % ahora sí podemos decir que es estable

num = [1 2];
den = [1 4 6 5 2];
FTLC = tf(num, den);
figure(3)
step(FTLC)

figure(4)
rlocus(FTLA)
    % para determinar en que valor de K el sistema se vuelve inestable
        % k>4 inestable

%% Sistema Inestable con k=10
k = 10;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);
figure(1)
nyquist(FTLA);         
    % hay 2 rodeos en el (-1;0)

figure(2)
pzmap(FTLA);

num = [10 20];
den = [1 4 6 5 12];
FTLC = tf(num, den);
figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)
    % hay 2 polos a la derecha del eje Imaginario, el sistema es inestable

%% Sistema Criticamente Estable con k=3.9375
k = 3.9375;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);
figure(1)
nyquist(FTLA);         
    % cae justo en (-1;0), lo hace criticamente estable

figure(2)
pzmap(FTLA);

num = [k 2*k];
den = [1 4 6 5 2+k];
FTLC = tf(num, den);
figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)
    % tenemos 2 polos en LC sobre el eje imaginario, oscila de manera
        % indefinida, aun asi es de fase minima 