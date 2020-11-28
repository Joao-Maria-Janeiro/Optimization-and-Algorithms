function f = f_nm(Y, D, n, m)
    f = (Y(m, :) - Y(n, :)) - D(m, n);
end