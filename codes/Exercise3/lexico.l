%{
    #include "sintactico.tab.h"
    /*
    externt yylval
    */
%}
number [0-9]+
variable [a-zA-Z]+
%%
{number}                {return (NUM);}
{variable}              {return (VAR);}
"+"                     {return (SYMBOLSUM);}
"\n"                    {return (EOL);}
.                       {return yytext[0];}
%%
int yywrap(){
    return 0;
}

