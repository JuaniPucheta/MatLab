%% Sistemas sobreamortiguados
clc;
z = [''];
p1 = 1;
k = p1;
p = [-p1];
[num,den] = zp2tf(z,p,k);
GA = tf(num, den);

z = [''];
p1 = 1;
p2 = 2;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GB = tf(num, den);

step(GA,GB)
title('Respuesta al Escalón - Sobreamortiguado')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t) - Primer Orden','CB(t) - Polos en -1 y -2')

%% Sistemas sobreamortiguados

z = [''];
p1 = 1;
p2 = 50;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GC = tf(num, den);

step(GA,GB,GC)
title('Respuesta al Escalón - Sobreamortiguado')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t) - Primer Orden','CB(t) - Polos en -1 y -50')



