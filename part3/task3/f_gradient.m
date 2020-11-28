function sum = f_gradient(Y, D)
    N = size(Y,1);
    sum = 0;
    for m = 1:N
        for n = (m+1):N
            sum = sum + 2 * f_nm(Y, D, n, m) * f_nm_gradient(Y, n, m)';
        end
    end
end