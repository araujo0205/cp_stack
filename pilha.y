%{
#include <stdio.h>
#include <string.h>
#include "pilha.h"

void yyerror(const char *str)
{
	fprintf(stderr, "erro r: %s\n",str);
}

int yywrap()
{
	return 1;
}

main()
{
	last = 0;
	yyparse();
}

%}

%token TOKPOP OPENP NUMBER CLOSEP TOKPUSH TOKLIST

%union
{
	int number;
}

%token <number> NUMBER

%%
commands: /* EMPTY */
	| commands command
	;

command: 
	pop 
	| 
	push 
	| 
	list
	;

pop:
	TOKPOP OPENP NUMBER CLOSEP
	{
		int popeado = pop($3);
		printf("\tPop value %d\n",popeado);
	}
	|
	TOKPOP NUMBER
	{
		int popeado = pop($2);
		printf("\tPop value %d\n",popeado);
	}
	;

push:
	TOKPUSH
	{
		if(last > 0)
		{
			int pusheado = push();
			printf("\tPop value %d\n",pusheado);	
		}
		else
		{
			printf("\tEmpty\n");
		}
	}
	;

list:
	TOKLIST
	{	
		if(last > 0)
		{
			int j;
			printf("[ ");
		   	for (j = 0; j < last; j++ )
			{
      				printf("%d ", pilha[j] );
   			}
			printf("]\n");
		}
		else
		{
			printf("[ ]\n");
		}
	}
	;
%%
