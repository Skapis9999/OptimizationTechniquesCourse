function [k,limits] = derivativeMethod(a,b,l,f)
%a is the lower limit
%b is the upper limit
%l is the final search margin
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3

limits = []; %all bounds for every k
k = 0;

n = -round(l/((b-a)*log(1/2)));

for k = 1:1:n
    x = (a+b)/2;
    d = derivativeSelector(x,f);
    if d==0
        return k
    elseif d > 0
        b = x;
    else 
        a = x;
    end
    limits = [limits;[a b]];    
end
end

