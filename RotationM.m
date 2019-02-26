function P = RotationM(theta)
P = [
    math.cos(theta), -math.sin(theta), 0, 0;
    math.sin(theta), math.cos(theta), 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1;
];
        