#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <time.h>
#include <dirent.h>

#include <string.h>

/* Función para devolver un error en caso de que ocurra */
void error(const char *s);

void printFileProperties(struct stat stats);

/* Función que hace algo con un archivo */
void fileProcess(char *path, char *archivo);

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
  printf("Folder: %s\n\n", path);
  while ((ent = readdir(dir)) != NULL)
  {
    /* Nos devolverá el directorio actual (.) y el anterior (..), como hace ls */
    if ((strcmp(ent->d_name, ".") != 0) && (strcmp(ent->d_name, "..") != 0))
    {
      /* Una vez tenemos el archivo, lo pasamos a una función para procesarlo. */
      fileProcess(path, ent->d_name);
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

void fileProcess(char *path, char *fileName)
{
  struct stat stats;

  char filePath[strlen(path) + strlen(fileName)];
  strcpy(filePath, path);
  strcat(filePath, fileName);

  if (stat(filePath, &stats) == -1)
    printf("Unable to get file properties for %s\n", filePath);

  printf("\nFile: %s", fileName);
  printFileProperties(stats);
}

void printFileProperties(struct stat stats)
{
  struct tm dt;

  // File permissions
  printf("\nFile access: ");
  if (stats.st_mode & R_OK)
    printf("read ");
  if (stats.st_mode & W_OK)
    printf("write ");
  if (stats.st_mode & X_OK)
    printf("execute");

  // File size
  printf("\nFile size: %ld", stats.st_size);

  // Get file creation time in seconds and
  // convert seconds to date and time format
  dt = *(gmtime(&stats.st_ctime));
  printf("\nCreated on: %d-%d-%d %d:%d:%d", dt.tm_mday, dt.tm_mon, dt.tm_year + 1900,
         dt.tm_hour, dt.tm_min, dt.tm_sec);

  // File modification time
  dt = *(gmtime(&stats.st_mtime));
  printf("\nModified on: %d-%d-%d %d:%d:%d", dt.tm_mday, dt.tm_mon, dt.tm_year + 1900,
         dt.tm_hour, dt.tm_min, dt.tm_sec);

  printf("\n\n");
}