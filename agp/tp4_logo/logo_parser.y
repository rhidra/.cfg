%{ // Définitions
  #include "logo.h"
  #include <stdio.h>
  #include <stdlib.h>

  #define YYERROR_VERBOSE

  PROG p1 = NULL; // Stocke le programme principal
  PROG proc = NULL; // Stocke les procédures secondaires

  PROG getProg() {
    return p1;
  }
%}

// Définition des tokens
%token TK_FORWARD TK_LEFT TK_RIGHT TK_REPEAT ENTIER TK_BEGIN TK_END
%token TK_SIZE TK_SPLIT TK_START TK_STOP TK_COLOR TK_TOGGLE TK_BACKWARD TK_ORIGIN
%token TK_PROC TK_NAME

%% // Règles

programme : programme instruction {
  $$ = addInstr($1, $2);
  p1 = $$;
} | instruction {
  $$ = $1;
  p1 = $$;
}

procedure : TK_PROC TK_NAME TK_BEGIN programme_proc TK_END {
  $$ = addInstr()
}

instruction : TK_FORWARD ENTIER {
  $$ = createInstr(FORWARD, $2, NULL);
} | TK_BACKWARD ENTIER {
  $$ = createInstr(BACKWARD, $2, NULL);
} | TK_LEFT ENTIER {
  $$ = createInstr(LEFT, $2, NULL);
} | TK_RIGHT ENTIER {
  $$ = createInstr(RIGHT, $2, NULL);
} | TK_SIZE ENTIER {
  $$ = createInstr(SIZE, $2, NULL);
} | TK_COLOR ENTIER {
  $$ = createInstr(COLOR, $2, NULL);
} | TK_REPEAT ENTIER TK_BEGIN programme TK_END {
  $$ = createInstr(REPEAT, $2, $4);
} | TK_SPLIT TK_BEGIN programme TK_END {
  $$ = createInstr(SPLIT, 0, $3);
} | TK_START {
  $$ = createInstr(START, 0, NULL);
} | TK_STOP {
  $$ = createInstr(STOP, 0, NULL);
} | TK_TOGGLE {
  $$ = createInstr(TOGGLE, 0, NULL);
} | TK_ORIGIN {
  $$ = createInstr(ORIGIN, 0, NULL);
}

%%
