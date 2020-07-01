%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    extern char *yytext;
    void yyerror(char* s);

%}
%token NUM
%token VAR
%token SYMBOLSUM
%token EOL

%left SYMBOLSUM
%%

s: expcad EOL                   
 | expnum EOL                       
 | expcad SYMBOLSUM expnum      {printf("Se reconocio una una suma de variables mas numeros \n");}
 | expnum SYMBOLSUM expcad      {printf("Se reconocio una de numeros mas variables \n");}
 ;

expcad: expcad SYMBOLSUM expcad {printf("Se reconocio una suma de variables \n");}
      | '(' expcad ')'
      | VAR
      ; 

expnum: expnum SYMBOLSUM expnum {printf("Se reconocio una suma de numeros \n");} 
      | '(' expnum ')'
      | NUM
      ; 

%%

void yyerror(char* s){
    printf(" Error sintactico: %s \n",s);
}

int main(int argc,char **argv){
    yyparse();
    return 0;
}