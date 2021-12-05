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

figure(1)
x = linspace(-2,2,20);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));
surf(x,y,z)

% [zx,zy] = gradient(z,0.2);
% delta = [zx,zy]

%%
%%Initiating values
x0 = [0, -1, 1];
y0 = [0, -1, 1];
epsilon = 0.001;

%% 
%%Method
% d = gradientDescentFixed(epsilon, 1,1)
[d2, xs, ys] = gradientDescent(epsilon, x0(1), y0(1));
% d3 = gradientDescentArmijo(epsilon, 1,1)
figure(2)
surf(x,y,z)
hold on
scatter3(xs,ys,(xs.^3).*(exp((-xs.^2)-(ys.^4))),'+','r')
hold on 
scatter3(xs(end),ys(end),(xs(end)^3)*(exp((-xs(end)^2)-(ys(end)^4))),'p','y')

figure(3)
clf
fcontour(@(x,y) (x^3)*(exp((-x^2)-(y^4))),[-2, 2])
hold on
scatter(xs,ys,'+','r')
hold on 
scatter(xs(end),ys(end),'p','k')
