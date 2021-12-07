function z = gammaOptimal(x,y,d,gamma)
syms g
x1 = x + g*d(1);
y1 = y + g*d(2);
f = (x1^3)*exp(-x1^2-y1^4);
z = vpa(subs(f,g,gamma));
end

