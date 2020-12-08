% load('data1.mat');
% load('data2.mat');
% load('data3.mat');
load('data4.mat');

%Amount_of input_features%
[n,K] = size(X);

%Stopping Criteria%
s0 = -ones(1,n);
r0 = 0;
epsilon = 10^(-6);
s_r0 = [s0 r0]';
A = [X; -ones(K,1)'];


%For the Backtracking Subroutine%
alpha0 = 1;
gama = 10^(-4);
beta = 0.5;
% gradients=[];


s_r= s_r0;
alpha = alpha0;
alpha_k = [];
g_k = gradient_function(s_r, A ,Y,K);
% gradients = [gradients norm(g_k)];
gradients = [norm(g_k)];

while (1)
    g_k = gradient_function(s_r, A ,Y,K);
    if norm(g_k) < epsilon
        break;
    end
    d = -hessian(s_r, A ,K)^(-1)*g_k;
    alpha = alpha0;
    while minimize_function(s_r+ alpha.*d, A, Y, K) >=... 
        minimize_function(s_r, A ,Y,K) + (gama.*g_k'*(alpha.*d))
        alpha = beta .* alpha;
    end
    alpha_k = [alpha_k alpha];
    s_r= s_r+ (alpha .* d);
    gradients = [gradients norm(g_k)];
    
end 

s = s_r(1:length(s_r)-1)
r = s_r(length(s_r))
iterations = length(gradients)

figure('Name', '||\nabla f(s_{k},r_[k})|| (Newton Method)');
semilogy(gradients,'LineWidth',1.50);
xlabel('k');
grid on;

figure('Name','Dataset 1(Newton Method)','NumberTitle','off');
stem(alpha_k,'LineWidth',1.50);
title('$$\alpha_k$$ (Newton Method)','interpreter','latex')
xlabel('k');