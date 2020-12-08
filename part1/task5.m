function task5(tk, ck, Rk, x_star, t_star, K)

cvx_begin quiet
    variable p0(2, 1)
    variable v(2, 1)
    k = 1:1:K;
    
    first_term = sum(square_pos(norms(p0 +t_star*v - x_star', 2, 1)));
    
    minimize(first_term);
    
    subject to
        norms([p0 p0 p0 p0 p0] + v*tk - ck', 2, 1) <= Rk;

cvx_end;

p0
v

figure
grid on


xlim([-6 14])
ylim([-6 12])

axis square

hold on

plot(p0(1) + v(1)*tk, p0(2) + v(2)*tk, 's', 'MarkerSize',12, 'Color', 'r');

hold on

plot(x_star(1),x_star(2),'x', 'Color', 'k');

hold on

viscircles(ck,Rk,'Color','b');
text(ck(:,1),ck(:,2),strcat(string(tk)), 'HorizontalAlignment', 'center',...
'FontName', 'Arial', 'FontSize', 10);   % plots the text inside each circle
hold on

plot(p0(1) + v(1)*t_star, p0(2) + v(2)*t_star, 's', 'MarkerSize',12,... 
'Color', 'r');

hold on



end
