function [x_new,y_new] = armijo(x,y,d)
    s=1; 
    a=0.01; 
    b=0.3; 
    m=0;
    
    gammaKappa = s*b^m;
    x_new = x - gammaKappa*d(1);
    y_new = y - gammaKappa*d(2);
    v1 = f(x,y);
    v2 = f(x_new,y_new);
    
    while (v1-v2)<=(-a*(b^m)*s*d'*grad(x,y))
        m = m+1;
        gammaKappa = s*b^m;
        x_new = x +gammaKappa*d(1);
        y_new = y +gammaKappa*d(2);
        v2 = f(x_new,y_new);
    end
end

