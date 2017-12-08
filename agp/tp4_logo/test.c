#include <stdio.h>
#include <stdlib.h>
#include "logo.h"
#include "logo_parser.tab.h"
#include "logo_svg.h"

int main() {
  // TEST : Etape 1
  // PROG inst22 = addInstrParam(NULL, LEFT, 90, NULL);
  // PROG inst21 = addInstrParam(inst22, FORWARD, 50, NULL);
  //
  // PROG inst3 = addInstrParam(NULL, FORWARD, 100, NULL);
  // PROG inst2 = addInstrParam(inst3, REPEAT, 4, inst21);
  // PROG inst1 = addInstrParam(inst2, FORWARD, 100, NULL);
  //
  // affiche(inst1);

  // TEST : Etape 2
  // yyparse();
  // PROG prog = getProg();
  // affiche(prog);

  // TEST : Etape 3
  yyparse();
  PROG prog = getProg();
  makeSVG(prog);
  freeProg(prog);

  return 0;
}
