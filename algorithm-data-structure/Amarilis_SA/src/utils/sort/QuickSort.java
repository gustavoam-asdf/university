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

  int partition(int[] arr, int low, int high) {
    int pivot = arr[high];
    int i = (low-1); // index of smaller element
    for (int j=low; j<high; j++) {
      // If current element is smaller than or
      // equal to pivot
      if (arr[j] <= pivot) {
        i++;
        // swap arr[i] and arr[j]
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
    // swap arr[i+1] and arr[high] (or pivot)
    int temp = arr[i+1];
    arr[i+1] = arr[high];
    arr[high] = temp;
    return i+1;
  }


  /* The main function that implements QuickSort()
  arr[] --> Array to be sorted,
  low --> Starting index,
  high --> Ending index */
  void sort(int[] arr, int low, int high) {
    if (low < high) {
			/* pi is partitioning index, arr[pi] is
			now at right place */
      int pi = partition(arr, low, high);

      // Recursively sort elements before
      // partition and after partition
      sort(arr, low, pi-1);
      sort(arr, pi+1, high);
    }
  }

  /* A utility function to print array of size n */
  static void printArray(int[] arr) {
    for (int j : arr) System.out.print(j + " ");
    System.out.println();
  }

  // Driver program
  public static void main(String[] args) {
//    int[] arr = {10, 7, 8, 9, 1, 5};
//    int n = arr.length;
//
//    QuickSort ob = new QuickSort();
//    ob.sort(arr, 0, n-1);
//
//    System.out.println("sorted array");
//    printArray(arr);
    Lista proveedores = new Lista();
    proveedores.add("LCP Construcciones");
    proveedores.add("Inversiones Olmo Peru");
    proveedores.add("Candamo");
    proveedores.add("Layer Company");
    proveedores.add("RV Bienes y Servicios");
    proveedores.add("Papeles & Computo S.A.C");

    mostrarProveedores(proveedores);

    proveedores = ordenar(proveedores);

  }


  public static void mostrarProveedores (Lista proveedores) {
    for (int i = 0; i < proveedores.size; i++) {
      System.out.println("==============================================");
      String proveedor = (String) proveedores.get(i).valor;
      System.out.println("Proveedor:           " + proveedor);
    }
  }
}