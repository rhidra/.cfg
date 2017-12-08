#include <stdlib.h>
#include <stdio.h>
#include "logo.h"

void affiche(PROG prog) {
	if(prog != NULL) {
		switch(prog->type) {
			case REPEAT:
				printf("REPEAT %d [\n", prog->param);
				affiche(prog->prog);
				printf("]\n");
				break;
			case SPLIT:
				printf("SPLIT [\n");
				affiche(prog->prog);
				printf("]\n");
				break;
			case LEFT:
				printf("LEFT %d\n", prog->param);
				break;
			case RIGHT:
				printf("RIGHT %d\n", prog->param);
				break;
			case FORWARD:
				printf("FORWARD %d\n", prog->param);
				break;
			case BACKWARD:
				printf("BACKWARD %d\n", prog->param);
				break;
			case SIZE:
				printf("SIZE %d\n", prog->param);
				break;
			case COLOR:
				printf("COLOR %d\n", prog->param);
				break;
			case ORIGIN:
				printf("ORIGIN\n");
			case STOP:
				printf("STOP\n");
				break;
			case START:
				printf("START\n");
				break;
			case TOGGLE:
				printf("TOGGLE\n");
				break;
		}

		affiche(prog->next);
	}
}

PROG addInstrParam(PROG prog, NODE_TYPE type, int param, PROG prog_repeat) {
	return addInstr(prog, createInstr(type, param, prog_repeat));
}

PROG addInstr(PROG prog, NODE* inst) {
	PROG temp;
	temp = prog;

	while(temp->next != NULL) {
		temp = temp->next;
	}
	temp->next = inst;

	return prog;
}

NODE *createInstr(NODE_TYPE type, int param, PROG prog) {
	NODE *temp = (NODE*) malloc(sizeof(NODE));
	temp->type = type;
	temp->param = param;
	temp->next = NULL;
	temp->prog = prog;

	return temp;
}

void freeProg(PROG prog) {
	if (prog != NULL) {
		if (prog->prog != NULL) {
			freeProg(prog->prog);
		}
		freeProg(prog->next);
		free(prog);
	}
}
