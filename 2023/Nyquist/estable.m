%% Nyquist - Sistema Estable

k = 1;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den)

figure(1)
    nyquist(FTLA)   % Trabaja con FTLA
    % no hay rodeos al (-1:0)
    % es estable si no hubiera polos a la derecha para FTLA
figure(2)
    pzmap(FTLA)
    % es de fase minima (esta todo a la izquierda)
    % ahora si podemos decir que es estable

num = [1 2];
den = [1 4 6 5 3];
FTLC = tf(num, den);

figure(3)
    step(FTLC)
figure(4)
    rlocus(FTLA)
    % para determinar en que valor de K el sistema se vuelve inestable
        % k>4 inestable

