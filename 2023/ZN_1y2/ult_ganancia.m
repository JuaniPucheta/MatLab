%% Metodo 2: Metodo de la Ultima Ganancia

p1 = 0;
p2 = 1;
p3 = 2;
    p = [-p1 -p2 -p3];
z = '';
k = 1 ;

[num, den] = zp2tfk(z,p,k)
Gp = tf(num, den)

kp = 1;
Gc = tf(kp);

FTLA = Gc * Gp

figure(1)
    rlocus(FTLA)
    % el valor de k lo veo en el eje Y antes de cruzar
    % el LGR cruza el eje imaginario, asi que voy a encontrar K critico