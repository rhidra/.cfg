#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  int note;
  int desc[2];
  int pid;

  if (pipe(desc) == 0) {
    if ((pid = fork()) == 0) {
      // Processus fils
      close(desc[1]); // Il faut fermer un accés au tube pour pouvoir utiliser l'autre
      do {
        sleep(1);
        read(desc[0], &note, sizeof(int));
        printf("reçu %d\n", note);
      } while (note >= 0);
      close(desc[0]);

    } else if (pid > 0) {
      // Processus père
      close(desc[0]);
      printf("Rentrez une note : ");
      do {
        scanf("%d\n", &note);

        write(desc[1], &note, sizeof(int));
      } while (note >= 0);
      close(desc[1]);

    }
  }

  return 0;
}
