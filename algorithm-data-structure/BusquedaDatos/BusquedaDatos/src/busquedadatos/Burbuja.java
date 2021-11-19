package busquedadatos;

public class Burbuja {
  public static void ordenar(Persona[] personas, String campo, boolean ascendentemente) {
    for (int i = 0; i < personas.length; i++) {
      for (int j = 0; j < personas.length - 1; j++) {
        String personaActual = personas[j].valueByCampo(campo);
        String personaSiguiente = personas[j + 1].valueByCampo(campo);
        if (ascendentemente ? personaActual.compareTo(personaSiguiente) > 0 : personaActual.compareTo(personaSiguiente) < 0) {
          Persona tmp = personas[j];
          personas[j] = personas[j + 1];
          personas[j + 1] = tmp;
        }
      }
    }
  }
}