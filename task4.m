function [] = task4(alpha,beta,algorithm,f)

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
    [k, limit] = derivativeMethod(alpha,beta,l ,f);
    kappas2(round((l-9e-3)/(1e-3))) = k;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
end

figure(8)
clf
X = 10e-3:1e-3:100e-3;
%Y = fliplr(kappas2);
Y = kappas2;
stem(X*100,Y,'BaseValue',0);
xlabel('l 10$^-1$','Interpreter','latex')
ylabel('Iterations')
title(sprintf('Iterations per l of %s',s))

%--------------------------------------------------
%I choose l = 10e-3, 20e-3, 100e-3

l_plot = [10e-3 20e-3 100e-3];
[~, limit1] = goldenRatioMethod(alpha,beta,l ,f);
[~, limit2] = goldenRatioMethod(alpha,beta,l ,f);
[~, limit3] = goldenRatioMethod(alpha,beta,l ,f);

limit1 = [-4 4;limit1];
limit2 = [-4 4;limit2];
limit3 = [-4 4;limit3];
figure(9)
clf
%x = linspace(-4,4);
plot(limit1(:,1),'--','LineWidth',2)
hold on
plot(limit1(:,2),'--','LineWidth',2)
hold on
plot(limit2(:,1),':','LineWidth',5)
hold on
plot(limit2(:,2),':','LineWidth',5)
hold on
plot(limit3(:,1))
hold on
plot(limit3(:,2))
legend('limits for l= 10$^-2$','limits for l=2 $10^-2$ ','limits for l= 10$^-1$','Interpreter','latex')
xlabel('Iterations')
ylabel('Value of function f')
title(sprintf('Limits alpha and beta of the iteration of %s',s))
fprintf('Limits for l= 10^-3 is [ %d, %d]\n',limit1(end,1),limit1(end,2))
fprintf('Limits for l= 2 * 10^-3 is [ %d, %d]\n',limit2(end,1),limit2(end,2))
fprintf('Limits for l= 100^-3 is [ %d, %d]\n',limit2(end,1),limit2(end,2))

end

