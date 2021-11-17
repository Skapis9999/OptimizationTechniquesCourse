function [returnV, limits] = fibonacciMethod(a,b,l,f)

%Bisection method is a root-finding method
%that applies to any continuous functions
%for which one knows two values with opposite signs.

%a is the lower limit
%b is the upper limit
%l is the final search margin
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3

limits = []; %all bounds for every k
k = 0;
i = 0;

while  fibonacci(i)<(b-a)/l
    i = i + 1 ;   
end

for k = 1:1:(i-1)
    x1 = a + fibonacci(i-k-1)/fibonacci(i-k+1)*(b-a);
    x2 = a + fibonacci(i-k)/fibonacci(i-k+1)*(b-a);
    if k == i-1
        x2 = a + fibonacci(i-k)/fibonacci(i-k+1)*(b-a)+0.001;
    end
    if functionSelector(x2,f) < functionSelector(x1,f)
        b = x1;
    else
        a = x2;
    end
    %fprintf("bumb k = %d\n", k)
    limits = [limits;[a b]];
    %fprintf("a = %d", limits(1,k), "b = %d\n", limits(2,k))
end

returnV = i-1;
end

