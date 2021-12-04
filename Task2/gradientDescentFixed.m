function [results, k] = gradientDescentFixed(epsilon,x,y)

k=1;
results(k) = f(x,y);
gammaKappa = 10;

while norm(grad(x,y)) >= epsilon
    d = grad(x,y);
    x = x - gammaKappa*d(1);
    y = y - gammaKappa*d(2);  
    k = k+1;
    results(k)=f(x,y); 
end  
end

