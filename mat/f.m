function Y=f(X,C)
%X et C sont de meme dimension 
    Y=0;
    [m,n]=size(C);
    Cnew=[C(1,:)];
    Xnew=[X(1,:)];
    for i=2:m
        Cnew=[Cnew,C(i,:)];
        Xnew=[Xnew,X(i,:)];
    end
    Y=Cnew*Xnew';
end
