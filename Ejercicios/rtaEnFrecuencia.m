%% Respuesta en frecuencia - Primera salida 
num = 100;
den = [1 10];
GA = tf(num, den)

t1 = 0:0.1:20;  %---------------- variable tiempo
t2 = 0:0.0001:1;
u1 = 1*sin(t1)  %---------------- entrada
u2 = 1*sin(100*t2)

figure(1)
lsim(GA, u1, t1)%---------------- para graficar, toma la FT que le indiquemos y haya la salida ante una entrada determinada
title('Respuesta ante entrada Senoidal')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t)')
ylim([-10 10])

figure(2)
lsim(GA, u2, t2)
title('Respuesta ante entrada Senoidal')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CA(t)') 
