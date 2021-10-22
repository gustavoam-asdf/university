package company.listas;

public class Lista {

  public Nodo raiz;
  public int size;

  public Lista () {
    this.raiz = null;
    this.size = 0;
  }

  public Lista (Object o) {
    this.add(o);
  }

  public void add (Object o) {
    Nodo nuevoNodo = new Nodo(o);
    if (this.raiz == null) {
      this.raiz = nuevoNodo;
      this.size++;
      return;
    }

    Nodo ultimoNodo = this.raiz;
    while (ultimoNodo.siguiente != null) {
      ultimoNodo = ultimoNodo.siguiente;
    }
    ultimoNodo.siguiente = nuevoNodo;
    this.size++;
  }

  // Mala práctica, demasiadas iteraciones
  public Nodo get (int index) {
    if (index >= this.size) {
      throw new IllegalArgumentException("List does not have that many items");
    }
    Nodo tmp = this.raiz;
    int counter = 0;
    while (tmp.siguiente != null && counter != index) {
      tmp = tmp.siguiente;
      counter++;
    }
    return tmp;
  }

  public void mostrar() {
    Nodo tmp = this.raiz;
    while (tmp.siguiente != null) {
      System.out.println(tmp.valor);
      tmp = tmp.siguiente;
    }
    System.out.println(tmp.valor);

  }

}
