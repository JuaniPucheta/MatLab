%% Lugar Geometrico de Las Raices 
% 

num = [1];
den = [1 2];
FTLA = tf(num, den);

figure(1)
    rlocus(FTLA)

k = 3;
num1 = [k];
den1 = [1 2+k];
FTLC1 = tf(num1, den1);

k = 32;
num2 = [k];
den2 = [1 2+k];
FTLC2 = tf(num2, den2);

k = 35;
num3 = [k];
den3 = [1 2+k];
FTLC3 = tf(num3, den3);

figure(2)
    step(FTLC1, FTLC2, FTLC3);

%% Lugar Geometrico de las Raices - Otro

num = [1];
den = [1 1 0];
FTLA = tf(num, den);

figure(1)
    rlocus(FTLA)

k = 0.05;
num = [k];
den = [1 1 k];
FTLC = tf(num, den)

k = 0.25;
num1 = [k];
den1 = [1 1 k];
FTLC1 = tf(num1, den1)

k = 10;
num2 = [k];
den2 = [1 1 k];
FTLC2 = tf(num2, den2)

figure(2)
    step(FTLC, FTLC1, FTLC2)
    xlim([0 30])
    legend('k=0.05', 'k=0.25', 'k=10')