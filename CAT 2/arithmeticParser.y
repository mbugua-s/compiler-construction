%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyerror(const char *s);
%}




%token NUMBER
%left '+' '-'
%left '*' '/'



%%

input: input statement '\n'
     | input statement
     |
     ;

statement: expr { printf("Result: %d\n", $1); }
            ;

expr: expr '+' expr   {$$ = $1 + $3; printf("Adding %d and %d to get %d \n", $1, $3, $$);  }
    | expr '-' expr   {  $$ = $1 - $3; printf("Subtracting %d and %d to get %d \n", $1, $3, $$); }
    | expr '*' expr   { $$ = $1 * $3; printf("Multiplying %d and %d to get %d \n ", $1, $3,$$);  }
    | expr '/' expr   { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
            
            
        } else {
            $$ = $1/$3;
            printf("Dividing %d by %d to get %d \n", $1, $3,$$);

        }
    }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER         { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

