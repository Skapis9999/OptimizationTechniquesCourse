function f_grad  = grad(x0,y0)
    syms x y
    fv = (x^3)*exp(-x^2-y^4);
    f1 = jacobian(fv,[x,y]);
    f_grad = vpa(subs(f1,[x,y],[x0,y0]));
end

