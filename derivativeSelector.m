function f = derivativeSelector(x,mode)
    %Function 1
    if mode==1
        a = 3;
        b = 2;
        c = 3;
        %F = (x-a)^b+(sin(x+c))^b;
        f = b*(x-a)^(b-1) + b*(sin(x+c)^(b-1))*cos(x+c);
    %Function 2    
    elseif mode==2
        a = 1;
        b = 0.5;
        c = 2;
        %F = (x-a)*cos(b*x)+x^c;
        f = cos(b*x) - (x-a)*sin(b*x)*b + c*x^(c-1);
    %Function 3    
    elseif mode==3
        a = 2;
        b = 2;
        c = 3;
        %F = (x+a)^b + exp(x-b)*sin(x+c);
        f = b*(x+a)^(b-1)+exp(x-b)*sin(x+c)+exp(x-b)*cos(x+c);
    %No function     
    else
        print("Wrong mode") 
    end
end


