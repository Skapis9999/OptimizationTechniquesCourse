function [k, limits] = bisectionMethod(a,b,l,e,f)
%Bisection method is a root-finding method
%that applies to any continuous functions
%for which one knows two values with opposite signs.

%a is the lower limit
%b is the upper limit
%l is the final search margin
%e is the constant value we use to examine the f function
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3

%Task 1 will have
%a = -4
%b = 4
%l = 0.01
%e = 0.001

limits = []; %all bounds for every k
k = 0;

while  b-a >= l
    x1 = (a + b)/2 + e;
    x2 = (a + b)/2 - e;
    if functionSelector(x2,f) < functionSelector(x1,f)
        b = x1;
    else
        a = x2;
    end
    k = k +1;
    %fprintf("bumb k = %d\n", k)
    limits = [limits;[a b]];
    %fprintf("a = %d", limits(1,k), "b = %d\n", limits(2,k))
end
end

