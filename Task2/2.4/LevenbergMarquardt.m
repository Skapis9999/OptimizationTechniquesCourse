function [results,xs,ys] = LevenbergMarquardt(e,x,y)
k=1;
results = [f(x,y)];
xs = [x];
ys = [y];

d = grad(x,y);
while norm(d) >= e
    
    h = hessianMatrix(x,y);
    m = 0; %m0 = 0
    pM = h + m*eye(size(h)); %positive defined Matrix
    if pM(1,1)<=0 || pM(1,1)*pM(2,2)-pM(1,2)*pM(2,1)<=0
        m = m + 0.5;
        pM = h+m*eye(size(h));
        if m > 1000
            disp('!!The hessian is not positive definite for any m-- Error!!')
            break
        end
    end
    dk = -d/pM;
    gammaKappa = goldenRatioMethod(x,y,dk);
    x = x + gammaKappa*dk(1);
    y = y + gammaKappa*dk(2);
    k = k+1;
    results = [results, f(x,y)];
    d = grad(x,y); % d  for the next loop with new x and new y
    xs = [xs, x];
    ys = [ys, y];

    end
l = length(xs)
end
