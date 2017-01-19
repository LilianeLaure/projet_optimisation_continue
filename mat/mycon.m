function [c,ceq] = mycon(x)
for i=1:length(x)
    ceq(i) = (x(i)-1)*x(i)  % Compute nonlinear equalities at x.
end
