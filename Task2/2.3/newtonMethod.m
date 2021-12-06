function [results,xs,ys] = newtonMethod(e,x,y)
k=1;
results = [f(x,y)];
xs = [x];
ys = [y];

d = grad(x,y);
while norm(d) >= e
    
    h = hessianMatrix(x,y);
    if h(1,1)<0 || h(1,1)*h(2,2)-h(1,2)*h(2,1)<0
        disp('!!The hessian is not positive definite -- Error!!')
        break
    end
    dk = -h'*d;
    gammaKappa = goldenRatioMethod(x,y,dk);
    x = x  + gamma*dk(1);
    y = y  + gamma*dk(2);

    k = k+1;
    results = [results, f(x,y)];
    d = grad(x,y); % d  for the next loop with new x and new y
    xs = [xs, x];
    ys = [ys, y];
end
end

