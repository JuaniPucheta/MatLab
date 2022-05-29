%% Primer Orden - Adicion de Ceros
% lo dividimos por el valor del polo para que nos de 1
z = '';
p = -1;
k = 1;
[num, den] = zp2tf(z,p,k);
G = tf(num, den);

step(G, 'k');
xlabel('Tiempo');
ylabel('Amplitud');
title('Adicion de ceros SPO')
hold on;

z = -8;
p = -1;
k = 1/8;
[num, den] = zp2tf(z,p,k);
G1 = tf(num, den);
step(G1, 'r')

z = -4;
p = -1;
k = 1/4;
[num, den] = zp2tf(z,p,k);
G2 = tf(num, den);
step(G2, 'b')

z = -1;
p = -1;
k = 1;
[num, den] = zp2tf(z,p,k);
G3 = tf(num, den);
step(G3, 'g')

z = -0.5;
p = -1;
k = 2;
[num, den] = zp2tf(z,p,k);
G4 = tf(num, den);
step(G4, 'm')

z = -2;
p = -1;
k = 1/2;
[num, den] = zp2tf(z,p,k);
G5 = tf(num, den);
step(G5, 'y')

legend('G(t) sin ceros', 'G1(t) z = -8', 'G2(t) z = -4', 'G3(t) z = -1', 'G4(t) z = -0.5', 'G5(t) z = -2')

%% Segundo Orden - Adicion de Ceros

z = '';
p = [-6 -1];
k = 1;
[num, den] = zp2tf(z,p,k);
G = tf(num, den);
step(G, 'k')

hold on;

z = -50;
p = [-6 -1];
k = 1/50;
[num, den] = zp2tf(z,p,k);
G1 = tf(num, den);
step(G2, 'r')

z = -6;
p = [-6 -1];
k = 1/6;
[num, den] = zp2tf(z,p,k);
G2 = tf(num, den);
step(G2, 'b')

z = -1;
p = [-6 -1];
k = 1;
[num, den] = zp2tf(z,p,k);
G3 = tf(num, den);
step(G3, 'y')

z = -1/2;
p = [-6 -1];
k = 2;
[num, den] = zp2tf(z,p,k);
G4 = tf(num, den);
step(G4, 'm')

z = 3;
p = [-6 -1];
k = -1/3;
[num, den] = zp2tf(z,p,k);
G5 = tf(num, den);
step(G5, 'g')

legend('G(t) sin ceros', 'G1(t) z = -50', 'G2(t) z = -6', 'G3(t) z = -1', 'G4(t) z = -0.5', 'G5(t) z = 3')
xlabel('Tiempo');
ylabel('Amplitud');
title('Adicion de ceros SSO')