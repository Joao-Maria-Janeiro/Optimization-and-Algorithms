function [gradientz,f_nms,grad_f] = f_gradient(Y, D, N, k)
%     sum = 0;
%     for m = 1:N
%         for n = (m+1):N
%             sum = sum + 2 * f_nm(Y, D, n, m) * f_nm_gradient(Y, n, m)';
%         end
%     end
    gradients = [];
    f_nms=[];
    for m =1:N
        for n = (m+1):N
            gradients = [
                gradients f_nm_gradient(Y( (k*m)-(k - 1):(k*m) ), Y( (k*n)-(k-1):(k*n) ), n, m, N, k)
            ];
            f_nms = [ f_nms f_nm(Y( (k*m)-(k - 1):(k*m) ), Y( (k*n)-(k-1):(k*n) ), D, n, m)];
        end
    end
    gradientz = gradients';
    grad_f = 2*gradients*f_nms';
end
