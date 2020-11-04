function f_val = f_derivative(X, Y, s, r)
    f_val = ((s' * exp(s' * X - r)) / (exp(s' * X - r) + 1)) - s * Y;
end