%{
int count = 1;
%}

%%
 // Exit the program on enter
[a-zA-z]+ ECHO; //print capital or small letters
[ \t]+ {printf(" \n"); count++; } //
[ \t]+[^ a-zA-Z]+ // ignore non alphabetic characters
[ \t]+[^ a-zA-Z]+[a-zA-z]+ {printf(" \n %s",yytext); count++; } //print words that start with a non alphabetic symbol
\n return 0;
. // ignore all other characters other than the ones specified above

%%

int yywrap(){}
int main(){

yylex();
printf("\nNumber of words"
      " in the given input - %d\n", count);
return 0;
}