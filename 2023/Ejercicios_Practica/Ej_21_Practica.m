k = 1;
num = [k];
den = [1 6 11 6];
FTLA = tf(num, den);
rlocus(FTLA);
    % si K>60, el sistema se vuelve inestable