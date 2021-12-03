#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include <string.h>

/* Función para devolver un error en caso de que ocurra */
void error(const char *s);
/* Función que hace algo con un archivo */
void procesoArchivo(char *archivo);

char *path;

int main(int argc, char *argv[])
{
  /* Con un puntero a DIR abriremos el directorio */
  DIR *dir;

  path = argv[1];

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
  while ((ent = readdir(dir)) != NULL)
  {
    /* Nos devolverá el directorio actual (.) y el anterior (..), como hace ls */
    if ((strcmp(ent->d_name, ".") != 0) && (strcmp(ent->d_name, "..") != 0))
    {
      /* Una vez tenemos el archivo, lo pasamos a una función para procesarlo. */
      procesoArchivo(ent->d_name);
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

void procesoArchivo(char *archivo)
{
  /* Para "procesar", o al menos, hacer algo con el archivo, vamos a decir su tamaño en bytes */
  /* para ello haremos lo que vemos aquí: https://poesiabinaria.net/2010/04/tamano-de-un-fichero-en-c/ */
  FILE *fich;
  long ftam;

  char myPath[strlen(path) + strlen(archivo)];
  strcpy(myPath, path);
  strcat(myPath, archivo);

  char *filePath = strcat(myPath, archivo);

  printf("Ubicación archivo: %s\n\n\n", filePath);

  fich = fopen(filePath, "r");
  if (fich)
  {
    fseek(fich, 0L, SEEK_END);
    ftam = ftell(fich);
    fclose(fich);
    /* Si todo va bien, decimos el tamaño */
    //printf ("%30s (%ld bytes)\n", archivo, ftam);
  }
  //  else
  /* Si ha pasado algo, sólo decimos el nombre */
  //printf ("%30s (No info.)\n", archivo);
}
