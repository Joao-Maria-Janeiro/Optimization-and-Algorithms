load('data2.mat');

%Amouns_rof inpus_rfeatures%
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
gradients=[];


s_r= s_r0;
alpha = alpha0;
while norm(gradient_function(A ,Y ,s_r, K)) >= epsilon
    d = -gradient_function(A ,Y ,s_r, K);
    alpha = alpha0;
    while minimize_function(s_r+ alpha.*d, A, Y, K) >= ... 
        minimize_function(s_r, A ,Y,K) + ...
        (gama.*gradient_function(A ,Y ,s_r, K)'*(alpha.*d))
        alpha = beta .* alpha;
    end
    s_r= s_r+ (alpha .* d);
    gradients = [gradients norm(gradient_function(A ,Y ,s_r, K))];
end

s = s_r(1:length(s_r)-1)
r = s_r(length(s_r))
iterations = length(gradients)

%Plot Graph of The Norm of The Gradient
figure('NumberTitle', 'off', 'Name', 'Task_3_Norm of The Gradient');
semilogy(gradients, 'LineWidth',2);
grid on;
title('Norm of the Gradient Along the Iterarions.')
xlabel('k')

%Plot Scatter
figure('NumberTitle', 'off', 'Name', 'Task_3_Dataset');
for i=1:K
   if Y(i) == 0
        a = scatter(X(1, i), X(2, i), [], 'red','LineWidth',1.25);
        hold on
    else
        b = scatter(X(1, i), X(2, i), [], 'blue','LineWidth',1.25);
        hold on
    end
       
end

x = linspace(-3,7);
y = s_r(3)/s_r(2) - x*(s_r(1)/s_r(2));
c = plot(x, y, '--y','Color','g', 'LineWidth', 1.5);
legend([a(1) b(1) c(1)], 'Y = 0', 'Y = 1', 's^Tx = r') 
title('Dataset data2.mat')
xlabel('x_1');
ylabel('x_2');