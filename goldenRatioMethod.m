function [k,limits] = goldenRatioMethod(a,b,l,f)
%a is the lower limit
%b is the upper limit
%l is the final search margin
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3

limits = []; %all bounds for every k
k = 0;
gamma = 0.618; %phi

while  b-a >= l
    x1 = a + gamma*(b-a);
    x2 = a + (1-gamma)*(b-a);
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

