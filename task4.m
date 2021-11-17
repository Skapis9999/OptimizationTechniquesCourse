function [] = task4(alpha,beta,algorithm)
%string for the algorithm
s='';
if algorithm==1
    s='Bisection method';
elseif algorithm==2
    s='Golden Ratio method';
elseif algorithm==3
    s='Fibonacci method';
elseif algorithm==4
    s='Bisection method using derivative';
else
    print("Wrong mode")
end

%--------------------------------------------------
kappas2 = zeros([91 1]);
e = 0.001;
limits = zeros([91 2]);
%We know that l>2e so l>0.002
for l = 10e-3:1e-3:100e-3
    [k, limit] = derivativeMethod(alpha,beta,l ,1);
    kappas2(round((l-9e-3)/(1e-3))) = k;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
end


end

