%% Ejercicio de Funciones de Transferencia
%   Sobreamortiguado: avanza lentamente hacia el equilibrio
%   Critc. amortiguado: se mueve lo mas rapidamente posible hacia el equilibrio, sin fluctuar sobre él
%   Subamortiguado: movimiento oscilatorio hasta que regresa a su posicion de equilibrio

s = tf("s");

%---Ejercicio 1.A---
primerG = 9 / (s^2 + 12*s + 9);

%---Ejercicio 2.A---
segundaG = 9 / (s^2+ 3*s + 9);

%---Ejercicio 3.A---
tercerG = 9 / (s^2 + 6*s + 9);


% Graficas del A)
figure(1)
    step(primerG, segundaG, tercerG)
    title('Ejercicio Pag.9 (A)')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('pG(t) - Subamortiguado', 'sG(t) - Critic. Amort.', 'tG(t) - Subamortiguado')

% Medidas de Rendimiento B)
[y, t] = step(primerG);
[y, t] = step(segundaG);
[y, t] = step(tercerG);
figure(2)
    step(primerG, segundaG, tercerG)
    title('EjB - Valor en estado estable = ' + num2str(round(y(end)), 2));

grid on

%% SSO Entrada Impulso

z = '';
k = 1;

p = [-2 + 3.5i, -2 - 3.5i];
[num, den] = zp2tf(z,p,k);
FTG = tf(num, den)

p = [-2 + 5i, -2 - 5i];
[num1, den1] = zp2tf(z,p,k);
FTG1 = tf(num1, den1)

p = [-2 + 6.5i, -2 - 6.5i];
[num2, den2] = zp2tf(z,p,k);
FTG2 = tf(num2, den2)

impulse(FTG, FTG1, FTG2, 'k')
    title('SSO - Entrada Impulso')
    xlabel("Tiempo")
    ylabel("Amplitud")

