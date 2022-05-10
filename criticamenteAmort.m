%% Sistemas criticamente amortiguados
clc;
z = [''];
p1 = 2;
k = p1;
p = [-p1];
[num,den] = zp2tf(z,p,k);
GA = tf(num, den);

clc;
z = [''];
p1 = 1;
p2 = 2
k = p1;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GA = tf(num, den);

z = [''];
p1 = 2;
p2 = 2;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GC = tf(num, den);

step(GA,GB)
title('Respuesta al Escalón - Criticamente Amortiguado')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t) - Primer Orden','CB(t) - Polos en -1 y -2','CC(t) - Polos doble -2')
