function [results, xs, ys] = gradientDescentArmijo(epsilon,x,y)

k=1;
results = [f(x,y)];
xs = [x];
ys = [y];

while norm(grad(x,y)) >= epsilon
    d = -grad(x,y);
    [x,y] = armijo(x,y,d);  
    k = k+1;
    results = [results, f(x,y)];
    xs = [xs, x];
    ys = [ys, y];
end  
l = length(xs)
end

