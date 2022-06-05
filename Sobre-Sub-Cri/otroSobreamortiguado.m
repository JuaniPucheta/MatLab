% Sistemas Sobreamortiguados
clc
z = '';
p1 = 1;
p2 = 6;

% Sistema de segundo orden
p = [-p1, -p2];
k = p1*p2;
[num, den] = zp2tf(z, p, k);
GSA = tf(num, den)

p2 = 50
p = [-p1, -p2];
k = p1*p2;
[num, den] = zp2tf(z, p, k);
GSA1 = tf(num, den)


% Sistema de primer orden
k = p1;
[num, den] = zp2tf(z, p, k);
GPO = tf(num, deen)
step(GPO, GSA, GSA1)



