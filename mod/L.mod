#------------------------------------------
#
# 
#
#------------------------------------------
# 
#------------------------------------------

param N, integer, > 0;			# nbr colonnes
param M, integer, > 0;			# nbr lignes


#--- Indices
set I := 1..M;					# indices lignes
set J := 1..N;					# indices colonnes


#--- Paramètres
param C{i in I, j in J};	# Coefficients de la fonc. objectif 
param A{i in I, j in J};	# Coefficients de la matrice des contraintes 
param b{i in I};			# Second membre des contraintes


#--- Variables de decision
var z{i in I, j in J, k in I}>=0;
var x{i in I,j in J}, binary; 


#--- Contraintes du probleme
s.t. capacity1{i in I, k in I}: sum{j in J}A[i,j]*z[i,j,k]<=(b[i]-A[i,k])*x[i,k] ;
s.t. capacity2{ i in I, k in I }: sum{j in J:j<>k}A[i,j]*x[i,j] - sum{j in J:j<>k}A[i,j]*x[i,j]*A[i,j]*z[i,j,k] <= b[i]-b[i]*x[i,k];
s.t. capacity3{j in J}: sum{i in I}x[i,j]=1;
s.t. capacity4{i in I,j in J, k in I}: z[i,j,k] <= x[i,j];
s.t. capacity5{i in I,j in J, k in I}: z[i,j,k] <= x[i,k];
s.t. capacity6{i in I,j in J, k in I}: x[i,k]+x[i,j]-z[i,j,k] <= 1;

#--- Critere a optimiser 
minimize profit: sum{i in I}sum{j in J} C[i,j]*x[i,j];

#--- END
