#include <stdio.h>
#include "calc.tab.h"

int main(int argc, char **argv)
{
	printf("Enter the expression to be calculated \n");
    yyparse();
}
