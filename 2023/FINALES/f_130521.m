% de Paola Giorsetti en PC/Para_render
%% Ejercicio 1c)
clc
num = [1];
den = [1 0 1];
%Otra forma
    %z = '';
    %p = [i -i]
    %[num, den] = zp2tf(z, p, 1)
G = tf(num, den);
impulse(G)

%% Ejercicio 3
num = 1;
den = [2 13 20];
G = tf(num, den)

figure(1)
    step(G)
    title('Respuesta al escalon')
figure(2)
    impulse(G)
    title('Respuesta al impulso')
figure(3)
    pzmap(G)
    title('Polos y Ceros en LA')

FTLC = feedback(G, 1)
figure(4)
    pzmap(FTLC)
    title('Polos y Ceros en LC')
