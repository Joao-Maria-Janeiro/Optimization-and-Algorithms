function gradientz = f_gradient(Y, D, N, k)
%     sum = 0;
%     for m = 1:N
%         for n = (m+1):N
%             sum = sum + 2 * f_nm(Y, D, n, m) * f_nm_gradient(Y, n, m)';
%         end
%     end
    gradients = [];
    for m =1:N
        for n = (m+1):N
            gradients = [
                gradients f_nm_gradient(Y( (k*m)-(k - 1):(k*m) ), Y( (k*n)-(k-1):(k*n) ), n, m, N, k)
            ];
        end
    end
    gradientz = gradients';
end
