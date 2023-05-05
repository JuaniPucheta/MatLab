%% Sistema Inestable con k=10
k = 10;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den);
figure(1)
    nyquist(FTLA)
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

