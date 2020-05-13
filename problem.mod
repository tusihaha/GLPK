set I;
/* set of courses */

set J;
/* set of rooms */

set K;
/* set of time slots */

set L;
/* exception courses */

set M;
/* exception rooms */

param cost{i in I, j in J, k in K}, >= 0;
/* cost of allocating room j to course i in time slot k */

var x{i in I, j in J, k in K} binary;
/* x[i,j,k] = 1 means room j is assigned to course i in time slot k
   x[i,j,k] = 0 otherwise  */

s.t. first{i in I}: sum{j in J, k in K} x[i,j,k] = 1;

s.t. second{j in J, k in K}: sum{i in I} x[i,j,k] <= 1;

s.t. third: sum{i in L, j in M, k in K} x[i,j,k] = 0;

minimize obj: sum{i in I, j in J, k in K} cost[i,j,k] * x[i,j,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, k in K} 'result: %s %s %s %s\n', i, j, k, x[i,j,k];

data;

set I := a b c d e;

set J := A B C;

set K := 1 2 3;

set L := a b c;

set M := C;

param cost :=
[*,*,1]: A B C :=
       a 1 1 1
       b 1 1 1
       c 1 1 1
       d 1 1 1
       e 1 1 1
[*,*,2]: A B C :=
       a 2 2 2
       b 2 2 2
       c 2 2 2
       d 2 2 2
       e 2 2 2
[*,*,3]: A B C :=
       a 3 3 3
       b 3 3 3
       c 3 3 3
       d 3 3 3
       e 3 3 3;

end;

