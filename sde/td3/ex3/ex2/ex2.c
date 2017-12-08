#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>

int main() {

	int pid, note, desc[2];

	if(mkfifo("fifo", S_IRUSR | S_IWUSR) == 0) { //creation du pipe bien passée
		if((pid = fork()) == 0) { //fils
      desc[0] = open("fifo", O_RDONLY);
			do{
				sleep(1);
				read(desc[0], &note, sizeof(int)); //lecture
				printf("Reçu %d.\n", note);
			} while(note >= 0);
			close(desc[0]); //fermer le tube en lecture

		} else if(pid >0) {
      desc[1] = open("fifo", O_WRONLY);
			printf("Entrez une suite de notes.\n");
			do {
				scanf("%d", &note);
				write(desc[1], &note, sizeof(int)); //ecriture dans le tube
			} while(note >=0);
			close(desc[1]);
		}
	}


	return 0;
}
