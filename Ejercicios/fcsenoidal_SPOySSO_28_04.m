%% Grafica 1 28/04
% Funcion senoidal SPO
t = [0: 0.1 :10];
u = 5*sin(t);

num = [1];
den = [5 1];
G = tf(num, den);

% Definir la entrada senoidal
lsim(G,u,t)
title("Respuesta SPO- Entrada Senoidal")
xlabel('Tiempo')
ylabel('Amplitud')

%% Grafica 2 - SSO Entrada Impulso

z = ''; % Donde se hace 0 el numerador, se pone '' haciendo referencia que no tiene 0
k = 1; % Ganancia

p = [-2+3.5i;-2-3.5i]; %polos
[num, den] = zp2tf(z,p,k);
FTG = tf(num,den)

p = [-2+5i;-2-5i];
[num1, den1] = zp2tf(z,p,k);
FTG1 = tf(num1, den1)

p = [-2+6.5i;-2-6.5i];
[num2, den2] = zp2tf(z,p,k);
FTG2 = tf(num2, den2)

impulse(FTG, FTG1, FTG2, 'k')
title("SSO - Entrada Impulso")
xlabel("Tiempo")
ylabel("Amplitud")








