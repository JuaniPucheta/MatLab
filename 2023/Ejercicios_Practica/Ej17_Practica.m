%% ------------inciso A----------------------
hold on;

k = 1;                   %es estable
%k = 2.5;                % se desestabiliza, polos a la derecha
    % Según cálculos en carpeta --> 0 < k < 1.55

num = [k (2*k)];
den = [1 3 3 2 k];
    %   G1.G2
    % ---------
    % 1+G1.G2.H
   
FTG = tf(num, den);     
step(FTG, '-m');

t = (0:0.1:100);
    unitstep =t >= 0;               % dibuja un escalón unitario, tenemos que tener definido t
plot(t, unitstep, '-g');            % para dibujar una linea cte (de referencia)
    title('Respuesta del sistema');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t)');
    xlim([0 80]);
    ylim([-2 5]);

figure(2);
pzmap(FTG)

%% ------------inciso B----------------------
hold on;

% Según cálculos en carpeta --> -1.5 < k < 6.5
    k = 1;  % Estable
    %k = 7;  % Inestable

num = [k];
den = [0.5 3 4 4.5 (3*k)];
    %  k.G1.G2
    % ---------
    % 1+G1.G2.H
   
FTG = tf(num, den);     
step(FTG, '-m');

t = (0:0.1:100);
    unitstep =t >= 0;               
plot(t, unitstep, '-g');            
    title('Respuesta del sistema');
    ylabel('Amplitud');
    xlabel('Tiempo');
    legend('C(t)');
    xlim([0 80]);
    ylim([-2 5]);

figure(2);
pzmap(FTG)

