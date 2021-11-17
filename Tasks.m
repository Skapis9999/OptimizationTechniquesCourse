clearvars
clc
%Skapetis Christos
%AEM 9378
%skapetis@ece.auth.gr
%1st Task main faction
%taski is the function for each algorithm with i = 1, 2, 3, 4
%functionSelector selects which faction to test
%functions for each algorithm

alpha = -4;
beta = 4;

lamda = 0.01;
algorithm = [1 2 3 4]; 
%1 is for Bisection method
%2 is for Golden Ratio method
%3 is for Fibonacci method
%4 is for Bisection method using derivative

i=3; %select which of the 3 functions are optimised
task1(lamda,alpha,beta,algorithm(1),i);
task2(alpha,beta,algorithm(2),i);
task3(alpha,beta,algorithm(3),i);
task4(alpha,beta,algorithm(4),i);