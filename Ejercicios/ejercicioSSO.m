%%Ejercicio de Funciones de Transferencia
%   Sobreamortiguado: avanza lentamente hacia el equilibrio
%   Criticamente amortiguado: se mueve lo más rapidamente posible hacia el
%equilibrio sin fluctuar sobre él
%   Subamortiguado: movimiento oscilatorio hasta que regresa a su posición
%de equilibrio

%% Ejercicio 1.A
s = tf("s");
primerG = 9 / (s^2 + 12*s + 9);

%% Ejercicio 2.A
s = tf("s");
segundaG = 9 / (s^2 + 3*s + 9);

%% Ejercicio 3.A
s = tf("s");
tercerG = 9 / (s^2 + 6*s + 9);

%% Graficas del A)
step(primerG, segundaG, tercerG);
title("Ejercicio Pag.9 (A)")
ylabel("Amplitud")
xlabel("Tiempo")
legend("pG(t) - Subamortiguado", "sG(t) - Criticamente amortiguado", "tG(t) : Sobreamortiguado")
 
%% Medidas de Rendimiento (B)
%% Valor en estado Estable

[y, t] = step(primerG);
[y, t] = step(segundaG);
[y, t] = step(tercerG);
step(primerG, segundaG, tercerG)
title("EjB - Valor en estado estable = " + num2str(round(y(end)), 2));
grid on