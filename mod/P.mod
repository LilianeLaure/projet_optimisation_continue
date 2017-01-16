#------------------------------------------
#
#
#
#------------------------------------------
# 
#------------------------------------------

#--- Nombre de variables et paramètres
param N, integer, > 0; # Paramètres
param M, integer, > 0; # Variables

#--- Indices
set I := 1..M; 
set J := 1..N; 

#--- Paramètres
param C{i in I, j in J};
param A{i in I, j in J};
param b{i in I};

#--- Variables de decision
var X{i in I, j in J}, binary;

#--- Contraintes du probleme
s.t. constraint1 {i in I}: sum{j in J}A[i,j]*X[i,j] <= b[i];
s.t. constraint2 {j in J}: sum{i in I}X[i,j] == 1;

#--- Critere a optimiser 
minimize profit: sum{i in I}sum{j in J}C[i,j]*X[i,j];


