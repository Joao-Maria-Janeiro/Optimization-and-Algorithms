function sum = f(Y, D)
    N = size(Y,1);
    sum = 0;
    for m = 1:N
        for n = (m+1):N
            sum = sum + (f_nm(Y, D, n, m)).^2;
        end
    end
end