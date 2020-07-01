%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    extern char *yytext;
    void yyerror(char* s);

%}
%token NUM
%token EOL

%left '+' '-'
%left '*' '/'

%%
stm_lst: stm stm_lst EOL 
       | stm EOL 
       ;

stm: exp        {printf("= %d \n",$1);
                exit(0);}
   ;

exp: exp '+' exp   { $$= $1 + $3;}
   | exp '-' exp   { $$= $1 - $3;}
   | exp '*' exp   { $$= $1 * $3;} 
   | exp '/' exp   { 
                      if($3!=0){
                        $$= $1 / $3;
                        }
                      else{
                        yyerror("No hay division entre 0");
                        $$ = 0;
                      }
                    }
   |  '{' exp '}'   { $$= $2;}
   |  '(' exp ')'   { $$= $2;}
   |  NUM           { $$= $1;}
   ;
%%

void yyerror(char* s){
    printf(" Error sintactico: %s \n",s);
}

int main(int argc,char **argv){
    yyparse();
    return 0;
}