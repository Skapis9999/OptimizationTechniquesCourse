function results = gradientDescentArmijo(epsilon,x,y)

k=1;
results = [f(x,y)];
gammaKappa = 1;

while norm(grad(x,y)) >= epsilon
    d = grad(x,y);
    [x,y] = armijo(x,y,d);  
    k = k+1;
    results = [results, f(x,y)];
end  
end

