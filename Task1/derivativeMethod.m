function [k,limits] = derivativeMethod(a,b,l,f)
%a is the lower limit
%b is the upper limit
%l is the final search margin
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3

limits = []; %all bounds for every k
k = 0;
n=0;

while (0.5)^n>l/(b-a)
    n=n+1;
end

for i = 1:1:n
    k = i;
    x = (a+b)/2;
    d = derivativeSelector(x,f);
    if d==0
        i = n; 
    elseif d > 0
        b = x;
        limits = [limits;[a b]];
    else 
        a = x;
        limits = [limits;[a b]];
    end   
end
end

