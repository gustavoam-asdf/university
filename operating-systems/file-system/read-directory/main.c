#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <time.h>
#include <dirent.h>
#include <string.h>

const char line[] = "===============================================";
const char subline[] = "-----------------------------------------------";

/* Función para devolver un error en caso de que ocurra */
void error(const char *s);

void printFileProperties(struct stat stats);

/* Función que hace algo con un archivo */
void readFile(char *path, char *archivo);

int main(int argc, char *argv[])
{
  /* Con un puntero a DIR abriremos el directorio */
  DIR *dir;

  char *path = argv[1];

  if (path == NULL)
    error("Debe ingresar una ubicacion correcta");

  if (!(path[strlen(path) - 1] == '/'))
    path = strcat(path, "/");

  /* en *ent habrá información sobre el archivo que se está "sacando" a cada momento */
  struct dirent *ent;

  /* Empezaremos a leer en el directorio actual */
  dir = opendir(path);

  /* Miramos que no haya error */
  if (dir == NULL)
    error("No puedo abrir el directorio");

  /* Una vez nos aseguramos de que no hay error, ¡vamos a jugar! */
  /* Leyendo uno a uno todos los archivos que hay */
  printf("%s\n", line);
  printf("Folder: %39s\n", path);
  printf("%s\n", line);
  while ((ent = readdir(dir)) != NULL)
  {
    /* Nos devolverá el directorio actual (.) y el anterior (..), como hace ls */
    if ((strcmp(ent->d_name, ".") != 0) && (strcmp(ent->d_name, "..") != 0))
    {
      /* Una vez tenemos el archivo, lo pasamos a una función para procesarlo. */
      readFile(path, ent->d_name);
    }
  }
  closedir(dir);

  return EXIT_SUCCESS;
}

void error(const char *s)
{
  /* perror() devuelve la cadena S y el error (en cadena de caracteres) que tenga errno */
  perror(s);
  exit(EXIT_FAILURE);
}

void readFile(char *path, char *fileName)
{
  struct stat stats;

  char filePath[strlen(path) + strlen(fileName)];
  strcpy(filePath, path);
  strcat(filePath, fileName);

  if (stat(filePath, &stats) == -1)
    printf("Unable to get file properties for %s\n", filePath);

  printf("\n%s\n", line);
  printf("File: %41s\n", fileName);
  printFileProperties(stats);
  printf("%s\n", line);
}

void printFileProperties(struct stat stats)
{
  struct tm dt;

  // File permissions
  printf("%s", subline);
  printf("\nFile permissions:");
  char permissions[30] = "";
  sprintf(permissions, "%s %s %s", R_OK ? "read" : "", W_OK ? "write" : "", X_OK ? "execute" : "");
  printf("%30s", permissions);
  printf("\n%s\n", subline);

  // File size
  char size[36];
  sprintf(size, "%ld bytes", stats.st_size);
  printf("File size: %36s\n", size);
  printf("%s\n", subline);

  // Get file creation time in seconds and
  // convert seconds to date and time format
  dt = *(gmtime(&stats.st_ctime));
  char creationTime[35];
  sprintf(creationTime, "%d/%d/%d %d:%d:%d", dt.tm_mday, dt.tm_mon, dt.tm_year + 1900,
          dt.tm_hour, dt.tm_min, dt.tm_sec);
  printf("Created on: %35s\n", creationTime);
  printf("%s\n", subline);

  // File modification time
  dt = *(gmtime(&stats.st_mtime));
  char modificationTime[34];
  sprintf(modificationTime, "%d/%d/%d %d:%d:%d", dt.tm_mday, dt.tm_mon, dt.tm_year + 1900,
          dt.tm_hour, dt.tm_min, dt.tm_sec);
  printf("Modified on: %34s\n", creationTime);
}