#include "logo_svg.h"

PEN createPen() {
  PEN pen = (PEN) malloc(sizeof(STYLO));
  pen->x = 0;
  pen->y = 0;
  pen->angle = 0;
  RGB_COLOR c = {0,0,0};
  pen->color = c;
  pen->strokeWidth = 2;
  pen->bTracing = 1;
  return pen;
}

void makeSVG(PROG prog) {
  IMAGE_INFO *info = getImageInfo(prog);
  printf("\n<svg width=\"%d\" height=\"%d\">\n", info->width, info->height);
  PEN pen = createPen();
  pen->x = info->originx;
  pen->y = info->originy;
  svg(prog, pen, info);
  free(pen);
  printf("</svg>\n");
}

void getImageInfo_recursive(PROG prog, PEN pen, IMAGE_INFO *info) {
  int i;
  STYLO oldPen;

  if (prog != NULL) {
    switch (prog->type) {
      case FORWARD:
        moveForward(pen, prog->param);
        break;
      case BACKWARD:
        moveForward(pen, -prog->param);
        break;
      case LEFT:
        rotate(pen, -prog->param);
        break;
      case RIGHT:
        rotate(pen, prog->param);
        break;
      case ORIGIN:
        pen->x = 0;
        pen->y = 0;
        break;
      case REPEAT:
        for (i = 0; i < prog->param; i++) {
          getImageInfo_recursive(prog->prog, pen, info);
        }
        break;
      case SPLIT:
        oldPen = *pen;
        getImageInfo_recursive(prog->prog, pen, info);
        pen = &oldPen;
        break;
      default:
        break;
    }
    if (pen->x > info->maxx) info->maxx = pen->x;
    if (pen->x < info->minx) info->minx = pen->x;
    if (pen->y > info->maxy) info->maxy = pen->y;
    if (pen->y < info->miny) info->miny = pen->y;

    getImageInfo_recursive(prog->next, pen, info);
  }
}

IMAGE_INFO *getImageInfo(PROG prog) {
  PEN pen = createPen();
  pen->bTracing = 0;
  IMAGE_INFO *info = (IMAGE_INFO*) malloc(sizeof(IMAGE_INFO));
  info->minx = 0;
  info->maxx = 0;
  info->miny = 0;
  info->maxy = 0;
  getImageInfo_recursive(prog, pen, info);
  info->originx = -info->minx + MARGE;
  info->originy = -info->miny + MARGE;
  info->width = info->maxx - info->minx + 2*MARGE;
  info->height = info->maxy - info->miny + 2*MARGE;

  return info;
}

void svg(PROG prog, PEN pen, IMAGE_INFO *info) {
  int i = 0;
  STYLO oldPen;

  if (prog != NULL) {
    switch (prog->type) {
      case FORWARD:
        moveForward(pen, prog->param);
        break;
      case BACKWARD:
        moveForward(pen, -prog->param);
        break;
      case LEFT:
        rotate(pen, -prog->param);
        break;
      case RIGHT:
        rotate(pen, prog->param);
        break;
      case REPEAT:
        for (i = 0; i < prog->param; i++) {
          svg(prog->prog, pen, info);
        }
        break;
      case COLOR:
        pen->color = getColor(prog->param);
        break;
      case SIZE:
        pen->strokeWidth = prog->param;
        break;
      case SPLIT:
        oldPen = *pen;
        svg(prog->prog, pen, info);
        pen = &oldPen;
        break;
      case START:
        pen->bTracing = 1;
        break;
      case STOP:
        pen->bTracing = 0;
        break;
      case TOGGLE:
        pen->bTracing = !pen->bTracing;
        break;
      case ORIGIN:
        resetPen(pen, info);
        break;
      default:
        printf("Instruction à transcrire dans le SVG non reconnue !\n");
        break;
    }
    svg(prog->next, pen, info);
  }
}

void moveForward(PEN pen, int val) {
  int oldx = pen->x;
  int oldy = pen->y;

  pen->x += val * cos(pen->angle * DEG_TO_RAD);
  pen->y += val * sin(pen->angle * DEG_TO_RAD);

  if (pen->bTracing)
    printf("<line x1=\"%d\" y1=\"%d\" x2=\"%d\" y2=\"%d\" style=\"stroke:rgb(%d,%d,%d);stroke-width:%d\"/>\n",
          oldx, oldy, pen->x, pen->y, pen->color.r, pen->color.v, pen->color.b, pen->strokeWidth);
}

void rotate(PEN pen, int val) {
  pen->angle += val;
}

void resetPen(PEN pen, IMAGE_INFO *info) {
  pen->x = info->originx;
  pen->y = info->originy;
  pen->angle = 0;
  pen->color = getColor(BLACK);
  pen->strokeWidth = 2;
  pen->bTracing = 1;
}

RGB_COLOR getColor(int c) {
  RGB_COLOR col;
  col.b = (c>>16)&0xFF;
  col.v = (c>>8)&0xFF;
  col.r = (c>>0)&0xFF;
  return col;
}
