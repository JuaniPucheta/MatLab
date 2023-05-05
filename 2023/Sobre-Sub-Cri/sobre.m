%% Sistemas Sobreamortiguados
clc

z = ''; 
p1 = 1;
p2 = 2;

%-----Sistema de 1er Orden-----
k = p1;
p = [-p1];
[num, den] = zp2tf(z,p,k)
GPO = tf(num, den)   % arranca respondiendo mas rapido
%------------------------------

%-----Sistema de 2do Orden-----
p = [-p1, -p2];     % definimos los polos
k = p1*p2;          % es el producto de las constantes
[num, den] = zp2tf(z,p,k);
GSA = tf(num,den)   % Gsistema SobreAmortiguado

p2 = 50;
p = [-p1, -p2];    
k = p1*p2;         
[num1, den1] = zp2tf(z,p,k);
GSA1 = tf(num1,den1)    % otra FT de 2do Orden
%------------------------------

step(GPO, GSA, GSA1)
    % GSA arranca como si fuese una parabola
    % GPO inmediatamente sufre un cambio y el sistema empieza a responder,
        % GSA no, y se toma un tiempo. Esa es la diferencia
    % GSA1 es muy parecida a GPO: a medida que alejamos el 2do polo del eje
        % imaginario, hacia la izquierda, el sistema se aproxima mas a un
        % sistema de 1er Orden. Mientras mas esté  alejado del sistema
        % imaginario, menos influye en la salida del sistema
    % 1erOrden la velocidad de respuesta es mas rapido. Inmediatamente sufre un cambio y responde.
        % 2do Orden no, se toma un tiempo
