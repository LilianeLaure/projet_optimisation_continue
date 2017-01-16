src_file = 'dat/1/a05100';
[C, A, b] = loadfile(src_file);
size(A)
X0=zeros(size(C));%point initial
fun = @(x) f(X0,C);
Aeq=ones(size(C));
[m,n]=size(Aeq)
beq=ones(1,m);
lb = zeros(m,n);
ub = ones(m,n);
%option = optimoptions('patternsearch','TolMesh',0.9,'ScaleMesh',false);
x = patternsearch(fun,X0,A,b',Aeq,beq,lb,ub,[])
%x = ga(fitnessfcn,nvars)

%x = ga(fun,m*n,A,b,Aeq,beq,lb,ub,[1:m*n])