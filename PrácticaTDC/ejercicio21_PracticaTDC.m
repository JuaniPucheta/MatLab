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
%--------------------------------------
k = 3;
num = [k];
den = [1 6 11 6];
FTG1 = tf(num, den);
step(FTG1, '-g'); 
%--------------------------------------
k = 4;
num = [k];
den = [1 6 11 6];
FTG3 = tf(num, den);
step(FTG3, '-y'); 
%--------------------------------------
k = 8;
num = [k];
den = [1 6 11 6];
FTG2 = tf(num, den);
step(FTG2, '-g'); 
%--------------------------------------
k = 45;
num = [k];
den = [1 6 11 6];
FTLA2 = tf(num, den);
FTLC2 = feedback (FTLA2, 1);  
step(FTLC2, '-k'); 

legend('step', 'k=1', 'k=150');
figure(2);
rlocus(FTLA);






