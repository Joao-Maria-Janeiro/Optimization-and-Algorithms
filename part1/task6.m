function task6(tk, ck, Rk,x_star, t_star, K)

cvx_begin quiet
    variable p0(2, 1)
    variable v(2, 1)
    k = 1:1:K;
    
    minimize(p0(1) + t_star*v(1));
    
    subject to
        norms([p0 p0 p0 p0 p0] + v*tk - ck', 2, 1) <= Rk;

cvx_end;

a1 = p0(1) + t_star*v(1)

cvx_begin quiet
    variable p0(2, 1)
    variable v(2, 1)
    k = 1:1:K;
    
    minimize(p0(2) + t_star*v(2));
    
    subject to
        norms([p0 p0 p0 p0 p0] + v*tk - ck', 2, 1) <= Rk;

cvx_end;

b1 = p0(2) + t_star*v(2)

cvx_begin quiet
    variable p0(2, 1)
    variable v(2, 1)
    k = 1:1:K;
    
    maximize(p0(1) + t_star*v(1));
    
    subject to
        norms([p0 p0 p0 p0 p0] + v*tk - ck', 2, 1) <= Rk;

cvx_end;

a2 = p0(1) + t_star*v(1)

cvx_begin quiet
    variable p0(2, 1)
    variable v(2, 1)
    k = 1:1:K;
    
    maximize(p0(2) + t_star*v(2));
    
    subject to
        norms([p0 p0 p0 p0 p0] + v*tk - ck', 2, 1) <= Rk;

cvx_end;

b2 = p0(2) + t_star*v(2)

figure
grid on


xlim([-6 20])
ylim([-6 20])

axis square

hold on



% hold on

plot(x_star(1),x_star(2),'x', 'Color',  [0 0.5 0],'Linewidth',8);

hold on

viscircles(ck,Rk,'Color','b');
text(ck(:,1),ck(:,2),strcat(string(tk)), 'HorizontalAlignment', ...
'center','FontName', 'Arial', 'FontSize', 10);% plots the text inside each circle
hold on

% plot(p0(1) + v(1)*t_star, p0(2) + v(2)*t_star, 's', 'MarkerSize',12, 'Color', 'r');

hold on

rectangle('Position',[a1 b1 a2-a1 b2-b1],'EdgeColor',[.5 0 .5],'Linewidth',2)



end
