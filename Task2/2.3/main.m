%%Clear Everything
clearvars
clc

%%
%%Info
%Skapetis Christos
%AEM 9378
%skapetis@ece.auth.gr
%3rd Task main faction

%%
%%Initiating values
x0 = [0, -1, 1];
y0 = [0, -1, 1];
epsilon = 0.001;

%%
%%Method

% [d, xs, ys] = newtonMethodFixed(epsilon, x0(2), y0(2));
% [d, xs, ys] = newtonMethod(epsilon, x0(3), y0(3));
[d, xs, ys] = newtonMethodArmijo(epsilon, x0(3), y0(3));


x = linspace(-2,2,20);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));

figure(1)
surf(x,y,z)
hold on
scatter3(xs,ys,(xs.^3).*(exp((-xs.^2)-(ys.^4))),'+','r')
hold on 
scatter3(xs(end),ys(end),(xs(end)^3)*(exp((-xs(end)^2)-(ys(end)^4))),'p','y')

figure(2)
clf
fcontour(@(x,y) (x^3)*(exp((-x^2)-(y^4))),[-2, 2])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')