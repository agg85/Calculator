calc: calc.l calc.y
	  bison -d calc.y
	  lex calc.l
	  gcc -w main.c calc.tab.c lex.yy.c -lfl -o main
	  ./main
