function [lamda] = task1(lamda,alpha,beta,algorithm,f)

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
kappas = zeros([100 1]);
for epsilon = 1e-5:1e-5:100e-5
    [k, ~] = bisectionMethod(alpha,beta,lamda,epsilon,f);
    kappas(round(epsilon/(1e-5))) = k;
end

figure(1) 
clf
X = 1e-5:1e-5:100e-5; 
Y = 2.*kappas;
stem(X*10000,Y,'BaseValue',2);
xlabel('e $10^-4$','Interpreter','latex')
ylabel('Iterations')
title(sprintf('Iterations per e of %s',s))

%--------------------------------------------------
kappas2 = zeros([91 1]);
e = 0.001;
limits = zeros([91 2]);
%We know that l>2e so l>0.002
for l = 10e-3:1e-3:100e-3
    [k, limit] = bisectionMethod(alpha,beta,l,e,f);
    kappas2(round((l-9e-3)/(1e-3))) = k;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
end

figure(2) 
clf
X = 10e-3:1e-3:100e-3; 
%Y = fliplr(kappas2);
Y = 2.* kappas2;
stem(X*100,Y,'BaseValue',0);
xlabel('l 10$^-1$','Interpreter','latex')
ylabel('Iterations')
title(sprintf('Iterations per l of %s',s))

%--------------------------------------------------
%I choose l = 10e-3, 20e-3, 100e-3

l_plot = [10e-3 20e-3 100e-3];
[~, limit1] = bisectionMethod(alpha,beta,l_plot(1),e,f);
[~, limit2] = bisectionMethod(alpha,beta,l_plot(2),e,f);
[~, limit3] = bisectionMethod(alpha,beta,l_plot(3),e,f);

limit1 = [-4 4;limit1];
limit2 = [-4 4;limit2];
limit3 = [-4 4;limit3];
figure(3) 
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
% fprintf('Limits for l= 10^-3 is [ %d, %d] and %d\n',limit1(end,1),limit1(end,2),(limit1(end,2)-limit1(end,1)))
% fprintf('Limits for l= 2 * 10^-3 is [ %d, %d]and %d\n',limit2(end,1),limit2(end,2),(limit2(end,2)-limit2(end,1)))
% fprintf('Limits for l= 100^-3 is [ %d, %d]and %d\n',limit2(end,1),limit2(end,2),(limit3(end,2)-limit3(end,1)))
end