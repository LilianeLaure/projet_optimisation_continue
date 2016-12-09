#------------------------------------------
#
# (c) Hacene Ouzia, Polytech'Paris UPMC
#
#------------------------------------------
# Exemple de modele avec gmpl  
#------------------------------------------

#--- Nombre de variables
param N, integer, > 0; 
param M, integer, > 0;
param K, integer, > 0;

#--- Indices des colonnes  
set I := 1..M; 

#--- Indices des lignes
set J := 1..N; 

set L :=1..I-1;
set O :=I+1..N;

#--- Coefficients de la fonc. objectif 
param c{i in I, j in J};

#--- Second membre des contraintes 
param b{i in I};

#--- Coefficients de la matrice des contraintes 
param a{i in I, j in J};

#--- Variables de decision
var z{i in I, j in J, k in J}>=0;
 var x{i in I,j in J}, binary; 

#--- Contraintes du probleme
s.t. capacity{i in I, k in I}: sum{j in J}a[i,j]*z[i,j,k]<=(b[i]-a[i,k])*x[i,k] ;
s.t. capacity{i in I,k in I}: sum{j in L}a[i,j]*x[i,j]+sum{j in O}a[i,j]*x[i,j]-sum{j in L}a[i,j]*z[i,j,k]-sum{j in O}a[i,j]*z[i,j,k]<=b[i]-b[i]*x[i,k];
s.t. capacity{j in J}: sum{i in I}x[i,j]=1;
s.t capacity{i in I,j in J, k in I}: z[i,j,k]<=x[i,j];
s.t capacity{i in I,j in J, k in I}: z[i,j,k]<=x[i,k];
s.t capacity{i in I,j in J, k in I}: x[i,k]+x[i,j]-z[i,j,k]<=1;

#--- Critere a optimiser 
minimize profit: sum{i in I}sum{j in J} c[i,j]*x[i,j];

#--- Commande pour lancer la resolution du probleme ... 
solve; 

##------------------------------------
## Section pour generer un rapport de resolution 
##-------------------------------------------------

printf '\n\n';
printf '#########################################\n';
printf '##  REPORTING \n'; 
printf '##\n'; 

printf "   Optimium objective value : %.2f \n", profit;
printf "   Optimal solution found:\n\n"; 
for(i in I){
 for{j in J}{
  printf '%5s %5s x(%s,%s) = %.2f',' ',i , j, x[i,j];
  for{k in I}{
   printf '%5s %5s %5s z(%s,%s,%s) = %.2f',' ',i , j, k, z[i,j,k];
  }
  printf "\n";  
 }
}

printf "\n"; 
printf "##\n"; 
printf "##########################################";
printf "\n\n"; 

end;	 
