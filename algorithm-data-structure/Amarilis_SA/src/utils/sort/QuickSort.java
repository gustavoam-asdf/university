package utils.sort;

import company.listas.Lista;
import company.listas.Nodo;

public class QuickSort {
  public static Lista ordenar (Lista l) {
    Lista nuevaLista = new Lista();
    Nodo primerElemento = l.raiz;
    String pivot = primerElemento.valor.toString();
    Lista parteIzquierda = new Lista();
    Lista parteDerecha = new Lista();
    for (int i = 1; i < l.size; i++) {
      Object el = l.get(i).valor;
      String s = el.toString();
      if (pivot.compareTo(s) >= 0) {
        parteIzquierda.add(el);
      } else {
        parteDerecha.add(el);
      }
    }

    System.out.println();
    System.out.println("====Pivote====");
    System.out.println(pivot);

    System.out.println("====Parte izquierda====");
    for (int i = 0; i < parteIzquierda.size; i++) {
      System.out.println(parteIzquierda.get(i).valor);
    }

    System.out.println("====Parte derecha====");
    for (int i = 0; i < parteDerecha.size; i++) {
      System.out.println(parteDerecha.get(i).valor);
    }


    if (parteIzquierda.size > 1) {
      parteIzquierda = ordenar(parteIzquierda);
    }

    if (parteDerecha.size > 1) {
      parteDerecha = ordenar(parteDerecha);
    }

    for (int i = 0; i < parteIzquierda.size; i++) {
      nuevaLista.add(parteIzquierda.get(i).valor);
    }

    nuevaLista.add(primerElemento.valor);

    for (int i = 0; i < parteDerecha.size; i++) {
      nuevaLista.add(parteDerecha.get(i).valor);
    }

    System.out.println("====Lista entregada====");
    for (int i = 0; i < nuevaLista.size; i++) {
      System.out.println(nuevaLista.get(i).valor);
    }

    return nuevaLista;

  }
}