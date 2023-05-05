%% Primer Orden
%-------------Sistema de 1er Orden sin ceros-------------
z = '';
p = -1;
k = 1;;
[num, den] = zp2tf(z,p,k);
G = tf(num, den);

hold on;

%-------------Sistema de 1er Orden con cero = -8-------------
z = -8;
p = -1;
k = 1/8;                    % lo dividimos por el valor del polo para que valga 1
[num, den] = zp2tf(z,p,k);
G1 = tf(num, den);

%-------------Sistema de 1er Orden con cero = -4-------------
z = -4;
p = -1;
k = 1/4;                    
[num, den] = zp2tf(z,p,k);
G2 = tf(num, den);

%-------------Sistema de 1er Orden con cero = -1-------------
z = -1;
p = -1;
k = 1;                    
[num, den] = zp2tf(z,p,k);
G3 = tf(num, den);

%-------------Sistema de 1er Orden con cero = -0.5-------------
z = -0.5;
p = -1;
k = 2;                    
[num, den] = zp2tf(z,p,k);
G4 = tf(num, den);

%-------------Sistema de 1er Orden con cero = 2-------------
z = 2;
p = -1;
k = -1/2;                    
[num, den] = zp2tf(z,p,k);
G5 = tf(num, den);

step(G, 'k', G1, 'b', G2, 'r',G3, 'g',G4, 'm', G5, 'y');
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Adicion de ceros SPO');
    legend('G(t) sin ceros', 'G1(t) -8', 'G2(t) -4', 'G3(t) -1', 'G4(t) -0.5','G5(t) 2')

%% Segundo Orden
z = '';
p = [-6 -1];
%k = 1;
[num, den] = zp2tf(z,p,1);
G = tf(num, den);

z = -50;
[num, den] = zp2tf(z,p,1/50);
G1 = tf(num, den);

z = -6;
[num, den] = zp2tf(z,p,1/6);
G2 = tf(num, den);

z = -1;
[num, den] = zp2tf(z,p,1);
G3 = tf(num, den);

z = -0.5;
[num, den] = zp2tf(z,p,2);
G4 = tf(num, den);

z = 3;
[num, den] = zp2tf(z,p,-1/3);
G5 = tf(num, den);

step(G, 'k', G1, 'b', G2, 'r',G3, 'g',G4, 'm', G5, 'y');
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Adicion de ceros SSO');
    legend('G(t) sin ceros', 'G1(t) -50', 'G2(t) -6', 'G3(t) -1', 'G4(t) -1/2','G5(t) 3')