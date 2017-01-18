%PAS FINI 

%On prend les valeurs 
src_file = '../dat/1/a05100';
[C,A,b] = loadfile(src_file);
[m,n] = size(A);
X0=zeros(m,n);%X0 de la taille de A
fun = @(x) f(X0,C);

%matrice des contraintes
B=zeros(m,2*n);
for i=1:m
    B(i,1+(i-1)*n:i*n)=A(i,:);
end

Aeq=diag(ones(1,n));
for i=2:m
    Aeq=[Aeq,diag(ones(1,n))];
end

beq=ones(n,1);
lb = zeros(m*n,1);
ub = ones(m*n,1);
X0=zeros(m*n,1);
x = patternsearch(fun,X0,B,b,Aeq,beq,lb,ub,@mycon)

% x = ga(fitnessfcn,nvars)



