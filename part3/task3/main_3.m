Y = csvread('../data/yinit3.csv');
X = csvread('../data/data_opt.csv');

k = 3;
N = size(Y, 1)/k;


% Y = [
%     Y_read(1:200) Y_read(201:end)
% ];

lambda_k = 1;
epsilon = k*10^(-2);


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
y_hat =  reshape(y_hat, 3, [] );
% plot( y_hat(1,:), y_hat(2,:))
%%
for i=1:N
        a = scatter3(y_hat(1,:), y_hat(2,:),y_hat(3,:), [], 'red','LineWidth',1.25);
          
%           plot(y_hat(i));
        hold on
       
end

% x = linspace(-3,7);
% y = s_r(3)/s_r(2) - x*(s_r(1)/s_r(2));
% c = plot(x, y, '--y','Color','g', 'LineWidth', 1.5);
% legend([a(1) b(1) c(1)], 'Y = 0', 'Y = 1', 's^Tx = r') 
% title('Dataset data1.mat')
% xlabel('x_1');
% ylabel('x_2');

