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
 task3(A, B, T, p_initial, p_final, w, tau, Umax, E, K, 10^(-1)); % c) devia dar 11 está a dar 79