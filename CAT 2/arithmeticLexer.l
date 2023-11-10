%{
#include "y.tab.h"
%}

%%

[0-9]+         {  yylval = atoi(yytext); printf("Number token found: %d\n", yylval); return NUMBER; }
[-+*/()]      { printf("Operator token found: %c\n", *yytext); return *yytext; }
[ \t]        ; /* Skip whitespace */
[\n]           { return 0; }  /* Indicates end of input */
.              { return *yytext; } /* Return any other character */

%%

int yywrap() {
    return 1;
}