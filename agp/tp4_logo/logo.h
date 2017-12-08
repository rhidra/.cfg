#ifndef _LOGO_H
#define _LOGO_H

// Includes
#include <stdio.h>
#include <stdlib.h>

// Définit les différents types d'instructions possibles
typedef enum node_type {
  FORWARD = 1,        // Le curseur avance
  LEFT = 2,           // Le curseur tourne à gauche
  RIGHT = 3,          // Le curseur tourne à droite
  REPEAT = 4,         // Répétition du bloc suivant
  COLOR = 5,          // Couleur du tracé
  SIZE = 6,           // Epaisseur du tracé
  SPLIT = 7,          // La section entre [] est exécutée indépendamment du reste
  STOP = 8,           // N'écrit plus
  START = 9,          // Recommence à écrire
  TOGGLE = 10,        // Ecrit ou n'écrit plus en fonction de l'état précédent
  BACKWARD = 11,      // Le curseur recule
  ORIGIN = 12         // Le curseur retourne à l'origine
} NODE_TYPE;

typedef struct noeud {
  // Type de l'instruction : FORWARD, LEFT, RIGHT, REPEAT, ...
  NODE_TYPE type;

  // Pointeur vers l'instruction suivante
  struct noeud *next;

  // Paramètre de l'instruction (dans "FORWARD a", 'a' est le paramètre)
  int param;

  // Pointeur vers un programme à exécuter
  // Utile uniquement pour REPEAT et SPLIT
  struct noeud *prog;
} NODE;

typedef NODE *PROG;

// Ajoute l'instruction composée des paramètres suivant en haut du programme
PROG addInstrParam(PROG prog, NODE_TYPE type, int param, PROG prog_repeat);

// Crée une instruction
NODE* createInstr(NODE_TYPE type, int param, PROG prog_repeat);

// Ajoute une instruction en haut du programme
PROG addInstr(PROG prog, NODE *instr);

// Libère l'arbre alloué en mémoire
void freeProg(PROG prog);

// Affiche le programme TC-LOGO
void affiche(PROG prog);

#endif
