% Y = csvread('../data/yinit2.csv');
X = csvread('../data/dataProj.csv');

k = 2;

lambda_k = 1;
epsilon = k*10^(-4);

y0_rand = randi([-5, 5], [size(X,1)*2,1]);
y1_rand = randi([-75, 75], [size(X,1)*2,1]);
y2_rand = randi([-50, 50], [size(X,1)*2,1]);
y3_rand = randi([-100, 100], [size(X,1)*2,1]);
y4_rand = randi([-250, 250], [size(X,1)*2,1]);
y5_rand = randi([-500, 500], [size(X,1)*2,1]);
y6_rand = randi([-1000, 1000], [size(X,1)*2,1]);

Y = y4_rand;
N = size(Y, 1)/k;
Z = pdist(X);
D = squareform(Z);


y_k = Y;

i = 1;

[g_k,f_nms,grad_f] = f_gradient(y_k, D, N, k);

cost_f = [];

while(1)
    [grad_fnm,f_nms,grad_f] = f_gradient(y_k, D, N, k);
    if norm(grad_f) < epsilon
        break
    end
    
    I = eye(size(Y,1));
    A = [
        grad_fnm;
        sqrt(lambda_k).*I
    ];
    b = [
        grad_fnm*y_k - f_nms';
        sqrt(lambda_k).*y_k
    ];
    
    y_hat = A \ b;
    
    [grad_fnm_hat,f_nms_hat,grad_f_hat] = f_gradient(y_hat, D, N, k);
    
    if f(f_nms_hat) < f(f_nms)
        y_k = y_hat;
        lambda_k = 0.7*lambda_k;
        f_nms = f_nms_hat;
        grad_fnm = grad_fnm_hat;
        grad_f = grad_f_hat;
    else
        lambda_k = 2*lambda_k;
    end
    i = i + 1;
    cost_f = [cost_f f(f_nms)];
    
end

%%
x = linspace(0,length(cost_f)-1,2.5);
figure('NumberTitle', 'off', 'Name', 'Cost function');
semilogy(0:length(cost_f)-1,cost_f,'o', 'LineWidth',1.25);
hold on;
semilogy(0:length(cost_f)-1,cost_f, 'LineWidth',1.25);
grid on;
title('Cost function')
xlabel('Task 3 , k = 2')
xticks(0:2.5:length(cost_f)-1)

%%
%Plot Scatter
figure('NumberTitle', 'off', 'Name', 'Task_2_Dataset');
y_hat =  reshape(y_hat, 2, [] );
plot( y_hat(1,:), y_hat(2,:))
%%
for i=1:N
        a = scatter(y_hat(1,:), y_hat(2,:), [], 'red','LineWidth',1.25);
          
%           plot(y_hat(i));
        hold on
       
end



