function gradient = f_nm_gradient(Y, n,m)
    numerator = Y(m, :) - Y(n, :);
    denominator = norm(Y(m, :) - Y(n, :));
    gradient = numerator/denominator;
end