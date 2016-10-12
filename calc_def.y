
%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}


%%

List    : List Expr '.' {printf("parsed expresion\n");}
	    | Expr '.' {printf("parsed expresion\n");}
        ;

Expr    : Term RExpr
        ;
RExpr   : '+' Term RExpr
        | '-' Term RExpr
        | %empty
        ;
Term    : Factor RTerm
        ;
RTerm   : '*' Factor
        | '%' Factor
        | %empty
        ;
Factor  : '(' Expr ')'
        | 'n'
        ;
%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
	return;
}

int main(void) {
	yyparse();
	return 0;
}
