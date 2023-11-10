/*** 134152, 115064, 131590, 136829, 134159, 103720, 137218 ***/

/*** Definition Section has one variable
which can be accessed inside yylex()
and main() ***/
%{
int capital = 0;
int small = 0;
int number = 0;
int operator = 0;
int other = 0;
%}
 
/*** Rule Section has three rules, first rule
matches with capital letters, second rule
matches with any character except newline and
third rule does not take input after the enter***/
%%
[A-Z] {printf("%s capital letter\n", yytext);
       capital++;}
[a-z] {printf("%s small letter\n", yytext);
       small++;}
[0-9] {printf("%s number\n", yytext);
       number++;}
"+"|"-"|"*"|"/"  {printf("%s operator\n", yytext);
       operator++;}
.     {printf("%s not a letter\n", yytext);
	other++;}
\n    {return 0;}
%%
 
/*** Code Section prints the number of
capital letter present in the given input***/
int yywrap(){}
int main(){
 
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer
 
// Uncomment the lines below
// to take input from file
// FILE *fp;
// char filename[50];
// printf("Enter the filename: \n");
// scanf("%s",filename);
// fp = fopen(filename,"r");
// yyin = fp;
 
yylex();
printf("\nNumber of Capital letters "
      "in the given input - %d\n", capital);
printf("\nNumber of Small letters "
      "in the given input - %d\n", small);
printf("\nNumber of Numbers "
      "in the given input - %d\n", number);
printf("\nNumber of Operators "
      "in the given input - %d\n", operator);
printf("\nNumber of other characters "
      "in the given input - %d\n", other);
 
return 0;
}