%% Sistemas subamortiguados
z = [''];
p1 = 0.2+3i;
p2 = 0.2-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GA = tf(num, den);

z = [''];
p1 = 0.8+3i;
p2 = 0.8-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GB = tf(num, den);

z = [''];
p1 = 1.7+3i;
p2 = 1.7-3i;
k = p1*p2;
p = [-p1,-p2];
[num,den] = zp2tf(z,p,k);
GC = tf(num, den);

step(GA,GB)
title('Respuesta al Escalón - Varia parte real de los polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t) - 0.2','CB(t) - 0.8','CC(t) - 1.7')
