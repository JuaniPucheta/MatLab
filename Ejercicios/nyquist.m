%% Nyquist - Sistema estable

k = 1;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den)

figure(1)
nyquist(FTLA)

figure(2)
pzmap(FTLA)

num = [1 2];
den = [1 4 6 5 3];
FTLC = tf(num, den)

figure(3)
step(FTLC)

figure(4)
rlocus(FTLA)

%% Nyquist - Sistema criticamente estable de fase minima

k = 3.9375;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den)

figure(1)
nyquist(FTLA)

figure(2)
pzmap(FTLA)

num = [k 2*k];
den = [1 4 6 5 2+k];
FTLC = tf(num, den)

figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)

%% Nyquist - Sistema inestable de fase minima

k = 10;
num = [k];
den = [1 4 6 5 2];
FTLA = tf(num, den)

figure(1)
nyquist(FTLA)

figure(2)
pzmap(FTLA)

num = [10 20];
den = [1 4 6 5 12];
FTLC = tf(num, den)

figure(3)
step(FTLC)

figure(4)
pzmap(FTLC)