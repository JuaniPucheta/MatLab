z = '';
p = [-2 -3 -4];
[num, den] = zp2tf(z,p,1);
Gp = tf(num, den);

%-----step------
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);
%---------------

figure(1)
    plot(t, C)
    legend('C(t) - Exacta')
    ylabel('Amplitud'); xlabel('Tiempo')

%------Punto de inflexion------
dC = diff(C)/dt;
d2C = diff(dC)/dt;
%---------------

figure(2)
    hold on
    plot(C); plot(dC); plot(d2C);
    legend('C(t)', 'dC(t)', 'd2C(t)')
    grid
    hold off;

[m, p] = max(dC)    % CONSOLA m = 0.0312
tpi = t(p)  % CONSOLA da (x) = 0.65, entonces en la grafica de plotC me fijo y marco valor en Y
% Y = mx * h --> 0.01167 = 0.0312*0.65 + h --> h = -0.00858

%---Calculo de L y T-----
L = 0.275
    % -h/m = 0.00858/0.0312
T = 1.3356
    % Primero obtengo el valor donde se estabiliza en la plotC (0.04166)
    % 0.04166 = m*T - h --> Taux = 1.6101 --> T = Taux - L

%---Tabla amarilla----
kp = 1.2*(T/L);
Ti = 2*L;
Td = 0.5*L;

num = [kp*Td*Ti kp*Ti kp];
den = [Ti 0];
Gc = tf(num, den);

FTLC = feedback(Gp*Gc, 1);
figure(3)
    hold on
    step(FTLC, '-r')
    title('PID - CRP');
    xlabel('Tiempo'); ylabel('Amplitud'); legend('PID sin mejora')
