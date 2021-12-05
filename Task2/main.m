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

x = linspace(-2,2,20);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));
surf(x,y,z)

% [zx,zy] = gradient(z,0.2);
% delta = [zx,zy]

%%
%%Initiating values
x0 = [0 -1 1];
y0 = [0 -1 1];
epsilon = 0.001;

%% 
%%Method
% d = gradientDescentFixed(epsilon, 1,1)
d2 = gradientDescent(epsilon, 1,1)
% d3 = gradientDescentArmijo(epsilon, 1,1)