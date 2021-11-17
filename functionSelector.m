function f = functionSelector(x,mode)
    %Function 1
    if mode==1
        a = 3;
        b = 2;
        c = 3;
        f = (x-a)^b+(sin(x+c))^b;
    %Function 2    
    elseif mode==2
        a = 1;
        b = 0.5;
        c = 2;
        f = (x-a)*cos(b*x)+x^c;
    %Function 3    
    elseif mode==3
        a = 2;
        b = 2;
        c = 3;
        f = (x+a)^b + exp(x-b)*sin(x+c);
    %No function     
    else
        print("Wrong mode") 
    end
end

