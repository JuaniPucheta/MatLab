%%Ejercicio 21
hold on;
t = (0:0.1:10)';
unitstep = t >= 0;
plot(t, unitstep, '-b')    
k = 1;
num = [k];
den = [1 6 11 6];
FTLA = tf(num, den);
FTLC = feedback (FTLA, 1);  
step(FTLC, '-r'); 