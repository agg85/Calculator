%{
	#include <stdio.h>
	int toPrint = 1; 
%}

/* declaring tokens */
%token NUM
%token ADD SUB MUL DIV OPB CLB LLS ALS LRS ARS POW
%token EOL

%%
	calclist: 
		| calclist res EOL { if(toPrint) printf("= %d\n", $2); toPrint=1; }
		;
		
	res: exp
		| res LLS exp { if($3<0) {printf("no. of shifts cannot be <0\n"); toPrint = 0; } else $$ = $1<<$3; } 
		| res ALS exp { if($3<0) {printf("no. of shifts cannot be <0\n"); toPrint = 0; } else $$ = $1<<$3; }
		| res LRS exp { if($3<0) {printf("no. of shifts cannot be <0\n"); toPrint = 0; } else $$ = (unsigned int)$1>>$3; }
		| res ARS exp { if($3<0) {printf("no. of shifts cannot be <0\n"); toPrint = 0; } else $$ = $1>>$3; }
		;
		
	exp: factor
		| exp ADD factor { $$ = $1 + $3; }
		| exp SUB factor { $$ = $1 - $3; }
		;

	factor: value
		| factor MUL value { $$ = $1 * $3; }
		| factor DIV value { if($3==0) { printf("denominator cannot be 0\n"); toPrint = 0; } else $$ = $1 / $3; }
		;
		
	value: term
		| term POW value { if($3<0) {printf("the power cannot be <0\n"); toPrint = 0; } int x=1,n=$3; for(int i=0;i<n;i++) x *= $1; $$ = x; }
		;
		
	term: NUM
		| ADD term { $$ = $2; }
		| SUB term { $$ = -$2; }
		| OPB res CLB { $$ = $2; }
		;
%%

int yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
    return 0;
}
