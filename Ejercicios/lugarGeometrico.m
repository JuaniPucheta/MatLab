%% Lugar Geometrico de las Raices

num = [1];
den = [1 2];
FTLA = tf(num, den)

figure(1)
rlocus(FTLA)

k = 3;  %------------ cuanto mas grande es k, mas negativo es el polo y mas rapida es la rta
num = [k];
den = [1 2+k];  
FTLC = tf(num, den)

k = 32;
num = [k];
den = [1 2+k]; 
FTLC1 = tf(num, den)

k = 35;
num = [k];
den = [1 2+k]; 
FTLC2 = tf(num, den)

figure(2)
step(FTLC, FTLC1, FTLC2)

%% Lugar Geometrico de las Raices - Otro

num = [1];
den = [1 1 0];
FTLA = tf(num, den)

figure(1)
rlocus(FTLA)

k = 0.05;  
num = [k];
den = [1 1 k];  
FTLC = tf(num, den)

k = 0.25;
num = [k];
den = [1 1 k];   
FTLC1 = tf(num, den)

k = 10;
num = [k];
den = [1 1 k];  
FTLC2 = tf(num, den)

figure(2)
step(FTLC, FTLC1, FTLC2)
xlim([0 30])
