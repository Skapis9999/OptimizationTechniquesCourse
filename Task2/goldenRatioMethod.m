function [gammaR] = goldenRatioMethod(x,y,d)
%a is the lower limit
%b is the upper limit
%l is the final search margin
%f is the mode of the three functions. 1 for f1, 2 for f2 and 3 for f3
%created for the first task

l = 0.01;
i = 1;
a = -4;
b = 4;
k = 0;
gamma = 0.618; %phi
flag = 1; %for the case that 

x1 = a + (1-gamma)*(b-a);
x2 = a + gamma*(b-a);
%temps are values that are used in the lagorithm of page 117
temp1 = gammaOptimal(x,y,d,x1);
temp2 = gammaOptimal(x,y,d,x2);
        
while  b-a >= l
    x1 = a + gamma*(b-a);
    x2 = a + (1-gamma)*(b-a);
    if temp1 > temp2
       a = x1;
       x1 = x2;
       x2 = a + gamma*(b-a);
       temp1 = temp2;
       temp2 = gammaOptimal(x,y,d,x2);
    else
        b = x2;
        x2 = x1;
        x1 = a +(1-gamma)*(b-a);
        temp2 = temp1;
        temp1 = gammaOptimal(x,y,d,x1);      
    end
end
gammaR = (a+b)/2; %gamma Result 
end

