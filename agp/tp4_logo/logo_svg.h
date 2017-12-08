#ifndef _LOGO_SVG_H
#define _LOGO_SVG_H

// Includes
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <strings.h>
#include "logo.h"

#define PI 3.14159265
#define DEG_TO_RAD PI/180

// Nombre de pixels de marge entre la bordure de l'image et le dessin
#define MARGE 5

// Structure pour la couleur du stylo
typedef struct color {
  // Quantité de rouge (de 0 à 255)
  int r;

  // Quantité de vert (de 0 à 255)
  int v;

  // Quantité de bleu (de 0 à 255)
  int b;
} RGB_COLOR;

// Convertit une couleur hexadécimale en struct COLOR
// Format de la couleur : c = B * 65536 + G * 256 + R
RGB_COLOR getColor(int c);

// COULEURS
#define RED 255
#define GREEN 65280
#define BLUE 16711680
#define CYAN 16711935
#define YELLOW 16776960
#define MAGENTA 65535
#define BLACK 0
#define WHITE 16777215
#define GRAY 8388607

// Structure du curseur utilisé pour dessiner
typedef struct stylo {
  // La position du stylo
  int x;
  int y;

  // L'angle du stylo, en degré
  int angle;

  // La couleur du stylo
  RGB_COLOR color;

  // L'épaisseur du trait
  int strokeWidth;

  // En train de tracer ?
  int bTracing;
} STYLO;

typedef struct stylo *PEN;

// Structure pour les conditions initiales de l'image
typedef struct imageInit {
  // Position initiale du curseur par rapport à une origine déplacée
  int originx;
  int originy;

  // Largeur et longueur de l'image
  int width;
  int height;

  // Positions maximales par rapport à l'origine
  int maxx;
  int minx;
  int maxy;
  int miny;
} IMAGE_INFO;

// Crée un stylo
PEN createPen();

// Ecrit le contenu du fichier SVG à partir de l'arbre d'un programme TC-LOGO
void makeSVG(PROG prog);

// Récupère les conditions intiales de l'image avant de commencer à tracer
IMAGE_INFO *getImageInfo(PROG prog);
void getImageInfo_recursive(PROG prog, PEN pen, IMAGE_INFO *info);

// Construit le fichier SVG récursivement
void svg(PROG prog, PEN pen, IMAGE_INFO *info);

// Déplace le stylo devant et inscrit dans la sortie la ligne SVG
void moveForward(PEN pen, int val);

// Tourne le stylo
void rotate(PEN pen, int val);

// Réinitialise les paramètres du stylo
void resetPen(PEN pen, IMAGE_INFO *info);

#endif
