function [gradient_k] = gradient_function(s_r, A ,Y,K)
    gradient_k = (1/K) * A*(exp(A'*s_r)./(1 + exp(A'*s_r)) - Y');
    
   
end