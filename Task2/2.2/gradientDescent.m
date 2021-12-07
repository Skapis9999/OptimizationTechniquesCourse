function [results, xs, ys] = gradientDescent(epsilon,x,y)

k=1;
results = [f(x,y)];
xs = [x];
ys = [y];

while norm(grad(x,y)) >= epsilon
    d = -grad(x,y);
    gammaKappa = goldenRatioMethod(x,y,d);
    x = x + gammaKappa*d(1);
    y = y + gammaKappa*d(2);  
    k = k+1;
    results = [results, f(x,y)];
    xs = [xs, x];
    ys = [ys, y];
end
l = length(xs)
end

