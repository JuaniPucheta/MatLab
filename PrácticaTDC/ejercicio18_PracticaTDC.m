k = 1;
num = k;
den = [1 2];
FTLA = tf(num, den)
rlocus(FTLA)%----------- para cualq valor de k, siempre es estable

FTLC = feedback(FTLA, 1)
figure(2)
step(FTLC)