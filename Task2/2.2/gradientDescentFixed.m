function [results, xs, ys] = gradientDescentFixed(epsilon,x,y)

k=1;
results = [f(x,y)];
gammaKappa = 1.2;
xs = [x];
ys = [y];

while norm(grad(x,y)) >= epsilon
    d = -grad(x,y);
    x = x + gammaKappa*d(1);
    y = y + gammaKappa*d(2);  
    k = k+1;
    results = [results, f(x,y)];
    xs = [xs, x];
    ys = [ys, y];
end
l = length(xs)
end

