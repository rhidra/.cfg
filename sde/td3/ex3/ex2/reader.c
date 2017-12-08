#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>

int main() {

  int note, desc[2];
  int res;

  res = access("fifo", F_OK);

  if (res == -1) {
    res = mkfifo("fifo", S_IRUSR | S_IWUSR);
  }

  if(res == 0) { //creation du pipe bien passée
    desc[0] = open("fifo", O_RDONLY);
    do{
      sleep(1);
      read(desc[0], &note, sizeof(int)); //lecture
      printf("Reçu %d.\n", note);
    } while(note >= 0);
    close(desc[0]); //fermer le tube en lecture
  }


  return 0;
}
