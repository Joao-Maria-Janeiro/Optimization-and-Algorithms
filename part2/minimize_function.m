function [f_function] = f(s_r, A ,Y,K)
    f_function = (1/K)*sum(log(1 + exp(A'*s_r)) - (Y.').*(A'*s_r));
end