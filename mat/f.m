function Y=f(X,C)
    Y=0;
    [m,n]=size(C);
    for i=1:m
        for j=1:n
            Y=Y+C(i,j)*X(i,j);
        end
    end
end
