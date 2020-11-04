function task2()
    load('data1.mat');
    x0 = min(X(:, 1)) + (max(X(:, 1))-min(X(:, 1))) .* rand(1,1);
    k = 1;
    epsilon = 10^(-6);
    s = [-1 -1];
    r = [0];
    g = [];
    d = [];
    alpha = [];
    K = size(Y, 2);
    
    a_hat = 1;
    gama = 10^(-4);
    beta = 0.5;
        
    while (1)
        g(k) = ((s(k)' * exp(s(k)' * X(k) - r(k))) / (exp(s(k)' * X(k) - r(k)) + 1)) - s(k) * Y(k)
        if norms(g(k), 2, 1) < epsilon
            break
        end
        d(k) = -g(k);
        
        % Subroutine
        a(k) = a_hat;
        while(1)
            if (f(X(k) + a(k)*d(k), Y(k), s(k), r(k)) < gama*f_derivative(X(k), Y(k), s(k), r(k))' *(a(k)*d(k)))
                break;
            end
            a(k) = beta * a(k);
        end
        %end subroutine
        k = k + 1;
    end
    g
end


%         f = log((1 + exp(s(k)' * X(k) - r(k))) - (Y(k)*(s(k)' * X(k) - r(k))))
%        
%         g(1) = gradient(f)