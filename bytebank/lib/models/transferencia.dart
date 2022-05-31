class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta
  );

//verificar no terminal:
  @override
  String toString() {
    return "Transferencia{valor: $valor, nº conta: $numeroConta}";
  }
}
