%% Sistemas subamortiguados - Variando parte real
z = [''];
p1 = 1+3i;
p2 = 1-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GA = tf(num, den);

z = [''];
p1 = 3+3i;
p2 = 3-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GB = tf(num, den);

z = [''];
p1 = 4+3i;
p2 = 4-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GC = tf(num, den);

step(GA,GB)
title('Respuesta al Escalón - Varia parte real de los polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t) - 1','CB(t) - 3','CC(t) - 4')
