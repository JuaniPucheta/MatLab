%% Nyquist - Sistema Criticamente Estable de Fase Minima

k = 3.9375;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);
figure(1)
    nyquist(FTLA);
    % cae justo en (-1;0), lo hace critic. estable
figure(2)
    pzmap(FTLA)

num = [k 2*k];
den = [1 4 6 5 2+k];
FTLC = tf(num, den);
figure(3)
    step(FTLC)
figure(4)
    pzmap(FTLC)
    % tenemos 2 polos en LC sobre el eje imaginario, oscila de manera
        % indefinida, aun asi es de fase minima
    