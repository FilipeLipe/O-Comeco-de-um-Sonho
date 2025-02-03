class Destinos {
  final int? id;
  final String nome;
  final String descricao;
  final double latitude;
  final double longitude;
  final String? imagePath;
  final bool visitado;

  Destinos({
    this.id,
    required this.nome,
    required this.descricao,
    required this.latitude,
    required this.longitude,
    this.imagePath,
    this.visitado = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'latitude': latitude,
      'longitude': longitude,
      'imagePath': imagePath,
      'visitado': visitado ? 1 : 0,
    };
  }

  factory Destinos.fromMap(Map<String, dynamic> map) {
    return Destinos(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      imagePath: map['imagePath'],
      visitado: map['visitado'] == 1,
    );
  }
}
