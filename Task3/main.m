%%Clear Everything

clearvars
clc

%%
%%Info
%Skapetis Christos
%AEM 9378
%skapetis@ece.auth.gr

%%
%%Init
epsilon = 0.01;
gamma = [0.05 0.5 2 10];
x0 = 1;
y0 = 1;

%3-D plot of the asking function

figure(1)
clf
x = linspace(-2,2,20);
y = x';
z = 0.5*(x.^2)+2*(y.^2);
surf(x,y,z)
legend('z','dot')
xlabel('x')
ylabel('y')
zlabel('z')
title('3-D plot of z = $0.5*x^{2} +2*y^{2}$ ','Interpreter','latex')

[~, xs, ys] = gradientDescentFixed(epsilon, x0, y0, gamma(2));

figure(2)
clf
surf(x,y,z)
hold on
scatter3(xs,ys,0.5*(xs.^2)+2*(ys.^2),'+','r')
hold on 
scatter3(xs(end),ys(end),0.5*(xs(end).^2)+2*(ys(end).^2),'p','y')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
zlabel('z')
title('z = $0.5*x^{2} +2*y^{2}$ with steps for Gradient Descent Method for gamma = 0.05 for (1,1)','Interpreter','latex')

figure(3)
clf
fcontour(@(x,y) 0.5*(x^2)+2*(y^2),[-2, 2])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $0.5*x^{2} +2*y^{2}$ with steps for Gradient Descent Method for gamma = 10 for (1,1)','Interpreter','latex')
