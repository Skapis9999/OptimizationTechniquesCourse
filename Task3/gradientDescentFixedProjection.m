function [results, xs, ys] = gradientDescentFixedProjection(epsilon,x,y,gammaKappa,xl,xu,yl,yu,s)
l=0;
k=1;
results = [f3(x,y)];
xs = [x];
ys = [y];

while norm(grad(x,y)) >= epsilon
    d = -grad(x,y);
    x_bar = x + s*d(1);
    y_bar = y + s*d(2);
    while xl>x_bar || xu<x_bar
        if xl>x_bar  
            x_bar = xl;
        elseif xu<x_bar
            x_bar = xu; 
        end
    end
    while yl>y_bar || yu<y_bar
        if yl>y_bar
            y_bar = yl;
        elseif yu<y_bar
            y_bar = yu; 
        end
    end
    x = x + gammaKappa*(x_bar - x);
    y = y + gammaKappa*(y_bar - y);
    k = k+1;
    results = [results, f3(x,y)];
    xs = [xs, x];
    ys = [ys, y];
    l = length(xs)
    if l > 200
        break
    end
end
l = length(xs)

end

