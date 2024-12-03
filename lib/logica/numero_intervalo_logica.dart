class NumeroIntervaloLogica {
  void calcularIntervalo(int inicio, int fin, Function imprimir) {
    if (inicio < fin) {
      for (int i = inicio; i <= fin; i++) {
        imprimir(i);
      }
    } else if (inicio > fin) {
      for (int i = inicio; i >= fin; i--) {
        imprimir(i);
      }
    } else {
      imprimir(inicio);
    }
  }
}
