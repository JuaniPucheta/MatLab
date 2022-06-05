%% Ejercicio (7) 
Wn = 2;

z = 0.1;
num = [Wn^2];
den = [1 (2*z*Wn) Wn^2];
G = tf(num, den);

z = 0.7;
num = [Wn^2];
den = [1 (2*z*Wn) Wn^2];
G1 = tf(num, den);

z = 2;
num = [Wn^2];
den = [1 (2*z*Wn) Wn^2];
G2 = tf(num, den);

impulse(G, G1, G2)
title('SSO - Respuesta Impulso - Variando Z')
xlabel('Tiempo')
ylabel('Amplitud')
legend('z = 0.1', 'z = 0.7', 'z = 2')

hold off;

figure(2);
pzmap(G, G1, G2);
