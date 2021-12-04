function [] = task3(alpha,beta,algorithm,f)

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
kappas3 = zeros([9 1]);

limits = zeros([9 2]);
%We know that l>2e so l>0.002
for l = 10e-3:1e-3:20e-3
    [k, limit] = fibonacciMethod(alpha,beta,l ,f);
    kappas3(round((l-9e-3)/(1e-3))) = k;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
end

figure(6)
clf
X = 10e-3:1e-3:20e-3;
%Y = fliplr(kappas2);
Y = kappas3;
stem(X*100,Y,'BaseValue',0);
xlabel('l 10$^-1$','Interpreter','latex')
ylabel('Iterations')
title(sprintf('Iterations per l of %s',s))

%--------------------------------------------------
%I choose l = 10e-3, 20e-3, 30e-3

l_plot = [10e-3 20e-3 30e-3];
[~, limit1] = fibonacciMethod(alpha,beta,l_plot(1) ,f);
[~, limit2] = fibonacciMethod(alpha,beta,l_plot(2) ,f);
[~, limit3] = fibonacciMethod(alpha,beta,l_plot(3) ,f);

limit1 = [-4 4;limit1];
limit2 = [-4 4;limit2];
limit3 = [-4 4;limit3];
figure(7)
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
legend('limits for l= 10$^-2$','limits for l=2 $10^-2$ ','limits for l= 3 * 10$^-3$','Interpreter','latex')
xlabel('Iterations')
ylabel('Value of function f')
title(sprintf('Limits alpha and beta of the iteration of %s',s))
% fprintf('Limits for l= 10^-3 is [ %d, %d]and %d\n',limit1(end,1),limit1(end,2),(limit1(end,2)-limit1(end,1)))
% fprintf('Limits for l= 2 * 10^-3 is [ %d, %d]\n',limit2(end,1),limit2(end,2))
% fprintf('Limits for l= 3* 10^-3 is [ %d, %d]\n',limit2(end,1),limit2(end,2))
end

