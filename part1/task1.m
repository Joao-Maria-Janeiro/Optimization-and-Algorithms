function task1(A, B, T, p_initial, p_final, w, tau, Umax, E, K, lambda)

cvx_begin quiet
    variable x(4, T+1)
    variable u(2,T)
    t = 2:1:T;
    
    first_term = sum(square_pos(norms(E*x(:,tau) - w', 2, 1)));
    second_term = sum(square_pos(norms(u(:, t) - u(:, t-1), 2, 1)));
    
    minimize(first_term + lambda * second_term);
    
    subject to
        x(1, 1) == p_initial(1);
        x(2, 1) == p_initial(2);
        x(3, 1) == 0;
        x(4, 1) == 0;
        x(1, T+1) == p_final(1);
        x(2, T+1) == p_final(2);
        x(3, T+1) == 0;
        x(4, T+1) == 0;
        norms(u, 2, 1) <= Umax;
        x(:, 2:T+1) == A*x(:, 1:T) + B*u(:, 1:T);

cvx_end;


% a)
figure()
plot(x(1,:), x(2,:), '.');
grid on;
hold on
plot(x(1,tau), x(2,tau), 'o');
hold on
plot(w(:, 1), w(:, 2), 's', 'MarkerSize',17);
hold off

% b)
figure()
i = 1:1:T;
plot(i, u(1,:), '-');
hold on
plot(i, u(2,:), '-');

% c)
counter = 0;
for j=2 : T
     if norms(u(:,j) - u(:,j-1), 2, 1) > 10^(-4)
        counter = counter + 1;
    end
end
counter

% d)
sum(norms(E*x(:,tau) - w', 2, 1)) / K

end
