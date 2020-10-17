A = [
        1 0 0.1 0;
        0 1 0 0.1;
        0 0 0.9 0;
        0 0 0 0.9
    ];
B = [
        0 0;
        0 0;
        0.1 0;
        0 0.1
    ];

T = 80;
p_initial = [0, 5];
p_final = [15, -15];
K = 6;
w = [
        10 10;
        20 10;
        30 10;
        30 0;
        20 0;
        10 -10
    ];
tau = [10 25 30 40 50 60] + 1;
Umax = 100;
t = 1:1:T;
E = [
        1 0 0 0; 
        0 1 0 0
    ];

% task1(A, B, T, p_initial, p_final, w, tau, Umax, E, K, 10^(-1));
% task2(A, B, T, p_initial, p_final, w, tau, Umax, E, K, 10^(-1)); % c) devia dar 11 está a dar 79
% task3(A, B, T, p_initial, p_final, w, tau, Umax, E, K, 10^(-1)); % c) devia dar 11 está a dar 79

K = 5;
tk = [0 1 1.5 3 4.5];
ck = [
    0.6332, -3.2012;
    -0.0054, -1.7104;
    2.3322, -0.7620;
    4.4526 3.1001;
    6.1752, 4.2391
];
Rk = [2.2727 0.7281 1.3851 1.8191 1.0895];
x_star = [6 10];
t_star = 8;
% task5(tk, ck, Rk, x_star, t_star, K);
task6(tk, ck, Rk, t_star, K);


