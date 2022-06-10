%% Bode - Sistema de fase minima

k = 1;
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H

figure(1)
rlocus(FTLA)

%% Sistema Estable
figure(2)
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
pzmap(FTLA)
figure(3)
bode(FTLA)
grid

figure(4)
nyquist(FTLA)

figure(5)
Ga = zpk([], [-0.0005], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
bode(FTLC)
grid

figure(7)
step(FTLC)

%% Sistema Inestable
k = 2;
figure(2)
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
pzmap(FTLA)
figure(3)
bode(FTLA)
grid

figure(4)
nyquist(FTLA)

figure(5)
Ga = zpk([], [-0.0005], 1);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], 1);
FTLA = Ga * Gp * H
nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
bode(FTLC)
grid

figure(7)
step(FTLC)

figure(8)
pzmap(FTLC)
title('Polos y ceros en FTLC')

%% Sistema Criticamente Establle
k = 1.555556;
figure(2)
Ga = zpk([], [0], 1);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], 1);
FTLA = Ga * Gp * H
pzmap(FTLA)
title('Polos y ceros de la FTLA')

figure(3)
bode(FTLA)
grid

figure(4)
nyquist(FTLA)

figure(5)
Ga = zpk([], [-0.0005], 1);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], 1);
FTLA = Ga * Gp * H
nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
bode(FTLC)
grid

figure(7)
step(FTLC)

figure(8)
pzmap(FTLC)
title('Polos y ceros en FTLC')