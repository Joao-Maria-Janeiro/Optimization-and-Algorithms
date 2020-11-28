function [hess] = hessian(s_r, A ,K)
    hess = 1/K * A * diag(exp(A'*s_r)./((1 + exp(A'*s_r)).^2)) * A';
end