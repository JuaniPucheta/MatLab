hold on;
k = 1;
num = [k (2*k)];
den = [1 3 3 2 k];

FTG = tf(num, den);
step(FTG, '-m');
t = (0:0.1:100)';
unitstep = t>=0; %----------------- dibuja el escalon unitario
plot(t, unitstep, '-g');

title('Respuesta del Sistema');
ylabel('Amplitud');
xlabel('Tiempo');
legend('C(t)');
xlim([0 80]);
ylim([-2 5]);