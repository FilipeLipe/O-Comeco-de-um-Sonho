import 'dart:convert';

class Conquistas {
  int? id;
  String titulo;
  String descricao;
  bool ativo;
  String? imagem;
  DateTime? dataConquista;
  String? local;
  String? experienciaDela;
  String? experienciaDele;

  Conquistas({
    this.id,
    required this.titulo,
    required this.descricao,
    this.ativo = false,
    this.imagem,
    this.dataConquista,
    this.local,
    this.experienciaDela,
    this.experienciaDele
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'ativo': ativo ? 1 : 0,
      'imagem': imagem,
      'dataConquista': dataConquista?.toIso8601String(),
      'local': local,
      'experienciaDela': experienciaDela,
      'experienciaDele': experienciaDele
    };
  }

  factory Conquistas.fromMap(Map<String, dynamic> map) {
    return Conquistas(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      ativo: map['ativo'] == 1,
      imagem: map['imagem'],
      dataConquista: map['dataConquista'] != null ? DateTime.parse(map['dataConquista']) : null,
      local: map['local'],
      experienciaDela: map['experienciaDela'],
      experienciaDele: map['experienciaDele']
    );
  }
}
