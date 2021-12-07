%%Clear Everything
clearvars
clc

%%
%%Info
%Skapetis Christos
%AEM 9378
%skapetis@ece.auth.gr
%4th Task main faction
%%
%%Initiating values
x0 = [0, -1, 1];
y0 = [0, -1, 1];
epsilon = 0.001;

%%
%%Method
i = 2; %x0 that we choose
% [d, xs, ys] = LevenbergMarquardtFixed(epsilon, x0(i), y0(i));
[d, xs, ys] = LevenbergMarquardt(epsilon, x0(i), y0(i));
% [~, xs, ys] = LevenbergMarquardtArmijo(epsilon, x0(i), y0(i));

x = linspace(-2,2,20);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));

%%
%%figures
figure(1)
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
% title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Levenberg Marquardt Method for gamma = 0.4 for (-1,-1)','Interpreter','latex')
title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Levenberg Marquardt Method for best gamma for (-1,-1)','Interpreter','latex')
% title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Levenberg Marquardt Method for Armijo gamma for (-1,-1)','Interpreter','latex')

figure(2)
clf
fcontour(@(x,y) (x^3)*(exp((-x^2)-(y^4))),[-2, 2])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for Levenberg Marquardt Method for best gamma for (-1,-1)','Interpreter','latex')