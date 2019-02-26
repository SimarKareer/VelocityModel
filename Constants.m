thetaR = 0;
thetaW1 = pi/6;
thetaW2 = pi/6;
thetaW3 = deg2rad(39);
thetaW4 = deg2rad(39);

massR = 2.650;
radiusR = 0.180;
radiusW = 0.025;
JR = 0.09293;
M = [massR 0 0; 0 massR 0; 0 0 JR];
T = [
    -cos(thetaW1) sin(thetaW1) radiusR;
    cos(thetaW2) sin(thetaW2) -radiusR;
    cos(thetaW3) -sin(thetaW3) radiusR;
    -cos(thetaW4) -sin(thetaW4) -radiusR;
];
T = T/radiusW;


%K = 1.460 / 39.5;
R = 0.608;

dt = 0.05;

alpha = log(0.95)/0.045;
beta = 0.021*0.045;



Acont = alpha \(M)*(T')*(T);
Acont = [
    Acont, zeros(3, 1);
    0, 0, 1, 0
];

Bcont = beta * M * T';
Bcont = [
    Bcont;
    zeros(1, 4);
];

[K, S, E] = lqr(Acont, Bcont, [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]*2.3e-3, eye(4)*1e-9);
sys = ss(Acont, Bcont, eye(4), eye(4));

sysd = c2d(sys, dt);

Adisc = sysd.A;
Bdisc = sysd.B;




