function gradient = f_nm_gradient(ym, yn, n, m, N, k)
%     numerator = Y(m, :) - Y(n, :);
%     denominator = norm(Y(m, :) - Y(n, :));
%     gradient = numerator/denominator;
    gradient = zeros(N*k, 1);
    for i=1:N
        for j = 1:k
            if i == m
                gradient((i*k) - k + j) = (ym(j) - yn(j)) / norm(ym-yn);

            elseif i == n
                gradient((i*k) - k + j) = (-1) * (ym(j) - yn(j)) / norm(ym-yn);
            
            end
            
        end
          
    end
end