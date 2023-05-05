%% Sistemas Sobreamortiguados
clc

z = '';                     % estamos aclarando que no tenemos ceros, entonces ponemos null
p1 = 1;                     % polo
%p2 = 6;
p2 = 2;

% Sistema de 2do Orden 
p = [-p1, -p2];             % definimos los polos
k = p1*p2;                  % es el producto de las constantes
[num, den] = zp2tf(z,p,k);
GSA = tf(num,den)           % Gsistema SobreAmortiguado
 
p2 = 50;
p = [-p1, -p2];            
k = p1*p2;                 
[num, den] = zp2tf(z,p,k);
GSA1 = tf(num,den)          % otra FT de 2do Orden

% Sistema de primer orden 
k = p1;
p = [-p1];
[num, den] = zp2tf(z,p,k);  
GPO = tf(num, den)          % arranca respondiendo mas rapido

step(GSA, GPO, GSA1)
    % GSA arranca como si fuese una parabola. 
        % GPO inmediatamente sufre un cambio y el sistema empieza a responder,
        % GSA no, y se toma un tiempo. Esa es la diferencia
    % GSA1 es muy parecida a GPO: a medida que alejamos el 2do polo del eje
        % imaginario, hacia la izquierda, el sistema se aproxima mas a un
        % sistema de 1er Orden. Mientras mas esté alejado del sistema
        % imaginario, menos influye en la salida del sistema
    % 1erOrden la velocidad de respuesta es mas rapido. Inmediatamente sufre un cambio y responde.
        % 2doOrden no, se toma un tiempo

%% Sistemas SubAmortiguados (variando parte REAL)
clc
z = '';
p1 = 0.2+3i;
p2 = 0.2-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA1 = tf(num, den)

p1 = 0.8+3i;
p2 = 0.8-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA2 = tf(num, den)

p1 = 1.7+3i;
p2 = 1.7-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA3 = tf(num, den)

step(GSubA1, GSubA2, GSubA3) 
    % GSubA1: la salida oscila, y va disminuyendo
        % overshoot: pico maximo (cuanto se pasa la salida del valor en el
            % cual se establiza, cuanto se pasa en porcentaje del valor final)
    % oscila menos cuando más grande es Sigma, las oscilaciones son mas suaves
    % todas tienen la misma frecuencia
title('Respuesta al Escalón - varía parte real de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('GSubA1(t) Sigma=0.2', 'GSubA2(t) Sigma=0.8', 'GSubA3(t) Sigma=1.7')

%% Sistema SubAmortiguado (variando parte IMAGINARIA)
clc
z = '';
p1 = 1+2i;
p2 = 1-2i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA1 = tf(num, den)

p1 = 1+3i;
p2 = 1-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA2 = tf(num, den)

p1 = 4+3i;
p2 = 4-3i;
p = [-p1, -p2];
k = p1*p2;

[num, den] = zp2tf(z,p,k);
GSubA3 = tf(num, den)

step(GSubA1, GSubA2, GSubA3) 
    % cambia la frecuencia de oscilacion
    % la envolvente exponencial es la misma
    % es mas oscilatorio, y tarda mas en estabilizarse 
title('Respuesta al Escalón - varía parte imaginaria de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('GSubA1(t) Wd=2', 'GSubA2(t) Wd=3', 'GSubA3(t) Wd=4')

       




