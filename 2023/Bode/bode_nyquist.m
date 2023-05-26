%% Bode - Sistema de Fase Minima

k = 1;
Ga = zpk([], [0], k);       % es lo mismo que poner k
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H;

figure(1)
    rlocus(FTLA)

%% Sistema Estable
k = 1;
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
figure(2)
    pzmap(FTLA)
figure(3)
    bode(FTLA)
grid

figure(4)
    nyquist(FTLA)

Ga = zpk([], [-0.0005], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k)
FTLA = Ga * Gp * H
figure(5)
    nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
    bode(FTLC)
grid

figure(7)
    step(FTLC)

%% Sistema Inestable
k = 2;
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
figure(2)
    pzmap(FTLA)
figure(3)
    bode(FTLA)
grid

figure(4)
    nyquist(FTLA)

Ga = zpk([], [-0.0005], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k)
FTLA = Ga * Gp * H
figure(5)
    nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
    bode(FTLC)
grid

figure(7)
    step(FTLC)
figure(8)
    pzmap(FTLC)
    title('Polos y Ceros en FTLC')

%% Sistema Criticamente Estable
k = 1.555556;
Ga = zpk([], [0], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k);
FTLA = Ga * Gp * H
figure(2)
    pzmap(FTLA)
    title('Polos y Ceros de la FTLA')

figure(3)
    bode(FTLA)
grid
figure(4)
    nyquist(FTLA)

Ga = zpk([], [-0.0005], k);
Gp = tf([k], [1 1 1]);
H = zpk([], [-2], k)
FTLA = Ga * Gp * H
figure(5)
    nyquist(FTLA)

FTLC = tf([k 2*k], [1 3 3 2 k])
figure(6)
    bode(FTLC)
grid

figure(7)
    step(FTLC)
figure(8)
    pzmap(FTLC)
    title('Polos y Ceros en FTLC')