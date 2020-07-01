%{
    #include "sintactico.tab.h"

%}
number [0-9]+
%%
{number}            {yylval = atoi(yytext);
                     return (NUM);}
\n                  {return (EOL);}
.                   {return yytext[0];}
%%
int yywrap(){
    return 0;
}

