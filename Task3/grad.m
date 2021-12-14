function f_grad  = grad(x0,y0)
    syms x y
    fv = 0.5*(x^2)+2*(y^2);
    f1 = jacobian(fv,[x,y]);
    f_grad = vpa(subs(f1,[x,y],[x0,y0]));
end

