function result = gradientDescent(epsilon,x,y)

while norm(grad(x,y)) >= epsilon
    [gammaKappa,~] = min(f(x-gammaKappa*norm(f(x,y))));
    x = x - gammaKappa*grad(x,y);  
    
result = x;
end

