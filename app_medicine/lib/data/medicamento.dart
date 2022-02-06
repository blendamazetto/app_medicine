class Medicamento {
  final String nome;
  final String descricao;
  final double quantidade;
  final int frequencia;
  final String tempo;
  final String data;
  final String valueQ;
  final String valueF;

  Medicamento(this.nome, this.descricao, this.quantidade, this.frequencia,
      this.tempo, this.data, this.valueQ, this.valueF);

  @override
  String toString() {
    return 'Medicamento {nome: $nome, descricao: $descricao, quantidade: $quantidade, frequencia: $frequencia, tempo: $tempo, data: $data, valueQ: $valueQ, valueF: $valueF}';
  }
}
