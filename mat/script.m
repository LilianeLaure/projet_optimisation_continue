% [C, A, b] = loadfile(src_file);
% size(A)
% X0=zeros(size(C));%point initial
fun = @(x) f(X0,C);
% Aeq=ones(size(C));
% [m,n]=size(Aeq)
% beq=ones(1,m);
% lb = zeros(m,n);
% ub = ones(m,n);
% option = optimoptions('patternsearch','TolMesh',0.9,'ScaleMesh',false);
% x = patternsearch(fun,X0,A,b',Aeq,beq,lb,ub,[])
% x = ga(fitnessfcn,nvars)

%x = ga(fun,m*n,A,b,Aeq,beq,lb,ub,[1:m*n])

% J'ai mis en commentaire les trucs de Elise mais 
% même ce qui est en dessous ne sert à rien

src_file = '../dat/1/a05100';
[C,A,b] = loadfile(src_file);
[m,n] = size(A);
Xo = zeros(m,n);
Xo(:,1) = 1;
Asub = zeros(1,m);
Aeq = zeros(1,n);
for i=1:m
    for j=1:n
        Asub(i) = Asub(i) + A(i,j)*Xo(i,j);
    end
end

for j=1:n
    for i=1:m
        Aeq(j) = Aeq(j) + Xo(i,j); 
    end
end
beq = ones(1,n);

Sol = patternsearch(fun,Xo,Asub,b,Aeq,beq);