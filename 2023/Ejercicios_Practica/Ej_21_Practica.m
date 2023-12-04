k = 1;
num = [k];
den = [1 6 11 6];
FTLA = tf(num, den);
rlocus(FTLA);
    % si K>60, el sistema se vuelve inestable

%% Otra forma con zp2tf
k = 1;
z = '';
p = [-1 -2 -3];
[num, den] = zp2tf(z,p,k);
FTLA = tf(num, den);

figure(1)
    rlocus(FTLA)
    title('Polos y Ceros de FTLA');
    ylabel('Amplitud'); xlabel('Tiempo')