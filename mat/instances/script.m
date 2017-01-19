src_file = 'dat/1/a20200';
dest_file = 'dat/a20200.dat';

dat_generator( src_file, dest_file );

% [ C1, Ain1, b1, Aeq1, beq1 ] = convertProb(C, A, b);
% 
% lb = zeros(1,m*n);      % lower bound
% ub = ones(1,m*n);       % upper bound
% intcon = ones(1,m*n);   % all variables are integers
% 
% % résolution intlinprog
% x = intlinprog(C1,intcon,Ain1,b1,Aeq1,beq1,lb,ub);
% %x = reshape(x,[m,n]);
% 
% fun = @(x) C1'*x;
% 
% x_pattern = patternsearch(fun,x,Ain1,b1,Aeq1,beq1,lb,ub);