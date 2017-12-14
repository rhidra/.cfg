%{
  #include "logo_parser.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include "logo.h"
  #include "logo_svg.h"

  int yywrap();
  int yyerror();
%}

%%
"FORWARD" {return TK_FORWARD;}
"BACKWARD" {return TK_BACKWARD;}
"LEFT" {return TK_LEFT;}
"RIGHT" {return TK_RIGHT;}
"REPEAT" {return TK_REPEAT;}
"SPLIT" {return TK_SPLIT;}
"SIZE" {return TK_SIZE;}
"STOP" {return TK_STOP;}
"START" {return TK_START;}
"TOGGLE" {return TK_TOGGLE;}
"ORIGIN" {return TK_ORIGIN;}
"COLOR" {return TK_COLOR;}

"RED" {yylval=RED; return ENTIER;}
"GREEN" {yylval=GREEN; return ENTIER;}
"BLUE" {yylval=BLUE; return ENTIER;}
"CYAN" {yylval=CYAN; return ENTIER;}
"YELLOW" {yylval=YELLOW; return ENTIER;}
"MAGENTA" {yylval=MAGENTA; return ENTIER;}
"BLACK" {yylval=BLACK; return ENTIER;}
"WHITE" {yylval=WHITE; return ENTIER;}
"GRAY" {yylval=GRAY; return ENTIER;}

\[ {return TK_BEGIN;}
\] {return TK_END;}
-?[0-9]* {yylval = atoi(yytext); return ENTIER;}

\n

\t
%%

int yywrap() {
  return 1;
}

int yyerror(const char *s) {
  printf("Erreur de parsing : %s !\n", s);
  exit(1);
}
