function results = gradientDescent(epsilon,x,y)

k=1;
results = [f(x,y)];

while norm(grad(x,y)) >= epsilon

    fun = @(gamma)f(x-gamma.norm(f(x,y)));
    gamma0 = 1;
    gammaKappa = fminsearch(fun,gamma0); 
    d = grad(x,y);
    x = x - gammaKappa*d(1);
    y = y - gammaKappa*d(2);  
    k = k+1;
    results = [results, f(x,y)];
end
end

