Y_read = csvread('../data/yinit2.csv');
X = csvread('../data/data_opt.csv');

k = 2;


Y = [
    Y_read(1:200) Y_read(201:end)
];

lambda_k = 1;
epsilon = k*10^(-2);


Z = pdist(X);
D = squareform(Z);


y_k = Y;

i = 1;

while(1)
    g_k = f_gradient(y_k, D);
    if norm(g_k) < epsilon
        break
    end
    
    I = eye(size(Y,1));
    A = [
        g_k';
        sqrt(lambda_k).*I
    ];
    b = [
        g_k'*Y - f(y_k, D);
        sqrt(lambda_k).*y_k
    ];
    
    y_hat = A \ b;
    
    if f(y_hat, D) < f(y_k, D)
        y_k = y_hat;
        lambda_k = 0.7*lambda_k;
    else
        lambda_k = 2*lambda_k;
    end
    i = i + 1;
end

