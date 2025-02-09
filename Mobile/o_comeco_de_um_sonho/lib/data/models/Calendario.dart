class Calendario {
  int? id;
  String titulo;
  DateTime data;
  String? descricao;

  Calendario({
    this.id,
    required this.titulo,
    required this.data,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'data': data.toIso8601String(),
      'descricao': descricao,
    };
  }

  factory Calendario.fromMap(Map<String, dynamic> map) {
    return Calendario(
      id: map['id'],
      titulo: map['titulo'],
      data: DateTime.parse(map['data']),
      descricao: map['descricao'],
    );
  }
}
