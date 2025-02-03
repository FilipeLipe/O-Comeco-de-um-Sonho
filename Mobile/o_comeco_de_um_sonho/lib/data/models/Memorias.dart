class Memorias {
  final int? id;
  final DateTime data;
  final String descricao;
  final String? imagePath;

  Memorias({
    this.id,
    required this.data,
    required this.descricao,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data.toIso8601String(),
      'descricao': descricao,
      'imagePath': imagePath,
    };
  }

  factory Memorias.fromMap(Map<String, dynamic> map) {
    return Memorias(
      id: map['id'],
      data: DateTime.parse(map['data']),
      descricao: map['descricao'],
      imagePath: map['imagePath'],
    );
  }
}
