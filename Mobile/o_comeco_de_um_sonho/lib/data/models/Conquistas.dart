class Conquistas {
  final int? id;
  final String titulo;
  final String descricao;
  final bool ativo;
  final String? imagem;
  final DateTime? dataConquista;
  final String? local;

  Conquistas({
    this.id,
    required this.titulo,
    required this.descricao,
    this.ativo = false,
    this.imagem,
    this.dataConquista,
    this.local,
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
    );
  }
}
