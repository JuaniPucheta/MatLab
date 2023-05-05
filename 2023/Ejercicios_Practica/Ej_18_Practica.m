k = 1;
num = [k];
den = [1 2];

FTLA = tf(num, den);
rlocus(FTLA);

FTLC = feedback(FTLA, 1);       % 1=H (retroalimentación)
figure(2);
step(FTLC);
