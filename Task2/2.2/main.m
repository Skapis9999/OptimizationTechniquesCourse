%%Clear Everything

clearvars
clc

%%
%%Info
%Skapetis Christos
%AEM 9378
%skapetis@ece.auth.gr
%1st Task main faction

%%
%%Main
%%Topic 1
%3-D plot of the asking function

% figure(1)
% clf
x = linspace(-2,2,20);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));
% surf(x,y,z)
% legend('z','dot')
% xlabel('x')
% ylabel('y')
% zlabel('z')
% title('3-D plot of z = $x^{3} * e^{-x^{2} - y^{4}}$ ','Interpreter','latex')


%%
%%Initiating values
x0 = [0, -1, 1];
y0 = [0, -1, 1];
epsilon = 0.001;

%% 
%%Method
i = 3; %x0 that we choose
% [~, xs, ys] = gradientDescentFixed(epsilon, x0(i), y0(i))
% [~, xs, ys] = gradientDescent(epsilon, x0(i), y0(i));
[~, xs, ys] = gradientDescentArmijo(epsilon, x0(i), y0(i))
figure(2)
clf
surf(x,y,z)
hold on
scatter3(xs,ys,(xs.^3).*(exp((-xs.^2)-(ys.^4))),'+','r')
hold on 
scatter3(xs(end),ys(end),(xs(end)^3)*(exp((-xs(end)^2)-(ys(end)^4))),'p','y')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
zlabel('z')
% title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Gradient Descent Method for gamma = 1 for (1,1)','Interpreter','latex')
% title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Gradient Descent Method best gamma for (0,0)','Interpreter','latex')
title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Gradient Descent Method Armijo gamma for (-1,-1)','Interpreter','latex')



figure(3)
clf
fcontour(@(x,y) (x^3)*(exp((-x^2)-(y^4))),[-2, 2])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Gradient Descent Method Armijo gamma for (-1,-1)','Interpreter','latex')
