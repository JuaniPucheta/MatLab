%% Sistema Critic. Amortiguados
clc

z = '';
p1 = 1;
k = p1;
p = [-p1];
[num, den] = zp2tf(z,p,k)
Ga = tf(num, den)

z = '';
p1 = 1;
p2 = 2
k = p1;
p = [-p1, -p2];
[num, den] = zp2tf(z,p,k)
Gb = tf(num, den)

z = '';
p1 = 2;
p2 = 2
k = p1*p2;
p = [-p1, -p2];
[num, den] = zp2tf(z,p,k)
Gc = tf(num, den)

step(Ga,  Gb, Gc)
    title('Respuesta al Escalon - Critic Amortiguado')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('Ca(t) - Primer Orden', 'Cb(t) polos -1 -2', 'Cc(t) polo doble -2')