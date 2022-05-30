%{
	#include "calc.tab.h"
	int yylval;
%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"(" { return OPB; }
")" { return CLB; }
"^" { return POW; }
"<<<" { return LLS; }
"<<"  { return ALS; }
">>>" { return LRS; }
">>"  { return ARS; }
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Invalid character %c\n", *yytext); }

%%
