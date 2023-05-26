%% Ejercicio diseño controlador
clc
z = '';
p = [1 6 0];
[num, den] = zp2tf(z, p, 1);
Gp = tf(num, den);

kp = 1;
GcP = tf(kp);

FTLA = GcP * Gp;

figure(1)
    rlocus(FTLA)
    title('LGR - Controlador P')   
    % no se puede hacer un análisis ya que el sistema es inestable
        % hay polos a la derecha del eje imaginario


