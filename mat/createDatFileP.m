function [] = createDatFileP( filename, C, A, b )

file = fopen(filename,'w');
[m,n] = size(C);

% en-tête
fprintf(file,'data;\n\n');

% dimensions
fprintf(file,'param M := %i;\n',m);
fprintf(file,'param N := %i;\n\n',n);

% Ecriture de C
fprintf(file,'param C :\t');
fprintf(file,'%i\t', 1:n);
fprintf(file,':=\n');
for i=1:m
    fprintf(file,'\t\t%i\t',i);
    fprintf(file,'%i\t',C(i,:));
    fprintf(file,'\n');
end
fprintf(file,';\n\n');

% Ecriture de A
fprintf(file,'param A :\t');
fprintf(file,'%i\t', 1:n);
fprintf(file,':=\n');
for i=1:m
    fprintf(file,'\t\t%i\t',i);
    fprintf(file,'%i\t',A(i,:));
    fprintf(file,'\n');
end
fprintf(file,';\n\n');

% Ecriture de b
fprintf(file,'param b := ');
fprintf(file,'%i  ', b);
fprintf(file,';\n\n');

% Fin de fichier
fprintf(file,'end;');

end