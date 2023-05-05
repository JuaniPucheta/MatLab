% Defino la funcion senoidal
t = [0:0.1:10];
u = 5*sin(t);       % la entrada
num = [1];
den = [5 1];
G = tf(num, den)

% Defino entrada senoidal
lsim(G,u,t)
    % esta desfasada y atenuada 
    % la amplitud es menor, tiene la misma frecuencia
title('Respuesta SPO entrada senoidal');
xlabel('Tiempo');
ylabel('Amplitud')
