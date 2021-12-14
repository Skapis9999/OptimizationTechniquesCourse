function [results, xs, ys] = gradientDescentFixed(epsilon,x,y,gammaKappa)

k=1;
results = [f3(x,y)];
xs = [x];
ys = [y];

while norm(grad(x,y)) >= epsilon
    d = -grad(x,y);
    x = x + gammaKappa*d(1);
    y = y + gammaKappa*d(2);  
    k = k+1;
    results = [results, f3(x,y)];
    xs = [xs, x];
    ys = [ys, y];
end
l = length(xs);
end

