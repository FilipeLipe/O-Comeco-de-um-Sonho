import 'dart:typed_data';

class Foto {
  int? id;
  Uint8List? foto;
  String? descricao;
  String? dataCaptura;

  Foto({
    this.id,
    this.foto,
    this.descricao,
    this.dataCaptura,
  });

  factory Foto.fromJson(Map<String, dynamic> json) {
    return Foto(
      id: json['id'],
      foto: json['foto'],
      descricao: json['descricao'],
      dataCaptura: json['dataCaptura'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto': foto,
      'descricao': descricao,
      'dataCaptura': dataCaptura,
    };
  }

  Foto copyWith({
    int? id,
    Uint8List? foto,
    String? descricao,
    String? dataCaptura,
  }) {
    return Foto(
      id: id ?? this.id,
      foto: foto ?? this.foto,
      descricao: descricao ?? this.descricao,
      dataCaptura: dataCaptura ?? this.dataCaptura,
    );
  }
}
