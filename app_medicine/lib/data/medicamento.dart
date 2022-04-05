class CamposMedicamento {
  static final List<String> values = [
    id, nome, descricao, quantidade, frequencia, tempo, data, valueQ, valueF, tipo
  ];

  static const String id = '_id';
  static const String nome = 'nome';
  static const String descricao = 'descricao';
  static const String quantidade = 'quantidade';
  static const String frequencia = 'frequencia';
  static const String tempo = 'tempo';
  static const String data = 'data';
  static const String valueQ = 'valueQ';
  static const String valueF = 'valueF';
  static const String tipo = 'tipo';
}

class Medicamento {
  final int? id;
  final String nome;
  final String descricao;
  final double quantidade;
  final int frequencia;
  final String tempo;
  final String data;
  final String valueQ;
  final String valueF;
  final String tipo;

  Medicamento(this.nome, this.descricao, this.quantidade, this.frequencia,
      this.tempo, this.data, this.valueQ, this.valueF, this.tipo, [this.id]);

  Map<String, dynamic> toMap() {
    return {
      'id'         : id,
      'nome'       : nome,
      'descricao'  : descricao,
      'quantidade' : quantidade,
      'frequencia' : frequencia,
      'tempo'      : tempo,
      'data'       : data,
      'valueQ'     : valueQ,
      'valueF'     : valueF,
      'tipo'       : tipo
    };
  }

  @override
  String toString() {
    return 'Medicamento {id: $id, nome: $nome, descricao: $descricao, quantidade: $quantidade, frequencia: $frequencia, tempo: $tempo, data: $data, valueQ: $valueQ, valueF: $valueF, tipo: $tipo}';
  }
}
