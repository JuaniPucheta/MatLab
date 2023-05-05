%% Sistemas SubAmortiguados (variando parte REAL)
clc

z = '';
p1 = 0.2+3i;
p2 = 0.2-3i;
p = [-p1, -p2];
k = p1*p2
[num, den] = zp2tf(z,p,k)
GSubA1 = tf(num, den)

p1 = 0.8+3i;
p2 = 0.8-3i;
p = [-p1, -p2];
k = p1*p2
[num, den] = zp2tf(z,p,k)
GSubA2 = tf(num, den)

p1 = 1.7+3i;
p2 = 1.7-3i;
p = [-p1, -p2];
k = p1*p2
[num, den] = zp2tf(z,p,k)
GSubA3 = tf(num, den)

step(GSubA1, GSubA2, GSubA3)
    title('Respuesta al Escalon - varia parte REAL')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('GSubA1(t) Sigma=0.2', 'GSubA2(t) Sigma=0.8', 'GSubA3(t) Sigma=1.7')
    % GSubA1: la salida oscila, y va disminuyendo
        % overshoot: pico maximo (cuanto se pasa la salida del valor en el
            % cual se estabiliza, cuanto se pasa en porcentaje del valor final)
        % oscila menos cuando mas grande es Sigma, las oscilaciones son mas suaves
        % todas tieen la misma frecuencia

%% Sistema SubAmortiguado (variando parte IMAGINARIA)
clc

z = '';
p1 = 1+2i;
p2 = 1-2i;
p = [-p1, -p2];
k = p1*p2;
[num, den] = zp2tf(z,p,k);
GSubA1 = tf(num, den);

p1 = 1+3i;
p2 = 1-3i;
p = [-p1, -p2];
k = p1*p2;
[num, den] = zp2tf(z,p,k);
GSubA2 = tf(num, den);

p1 = 1+4i;
p2 = 1-4i;
p = [-p1, -p2];
k = p1*p2;
[num, den] = zp2tf(z,p,k);
GSubA3 = tf(num, den);

step(GSubA1, GSubA2, GSubA3)
    title('Respuesta al Escalon - variando parte imaginaria')
    ylabel('Amplitud')
    xlabel('Tiempo')
    legend('GSubA1(t) Wd=2', 'GSubA2(t) Wd=3', 'GSubA3(t) Wd=4')
        % cambia la frecuencia de oscilacion
        % la envolvente exponencial es la misma
        % es mas oscilatorio, y tarda mas en estabilizarse