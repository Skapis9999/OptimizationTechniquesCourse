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
x_l = -15; %lower
x_u = 15;  %upper
y_l = -20; %lower
y_u = 12;  %upper
s = [8 10 0.5];
gamma = [0.05 0.3 0.1];
x0 = [10 -7 17];
y0 = [-5 5 -5];
epsilon = [0.01 0.02 0.01];

x = linspace(-20,20,40);
y = x';
z = 0.5*(x.^2)+2*(y.^2);

i = 3;
[~, xs, ys] = gradientDescentFixedProjection(epsilon(i), x0(i), y0(i), gamma(i),x_l,x_u,y_l,y_u,s(i));

figure(1)
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
title('z with steps for Gradient Descent Projection Method for gamma = 0.1 for (17,-5)','Interpreter','latex')

figure(2)
clf
fcontour(@(x,y) 0.5*(x^2)+2*(y^2),[-20, 20])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z with steps for Gradient Descent Projection Method for gamma = 0.1 for (17,-5)','Interpreter','latex')
