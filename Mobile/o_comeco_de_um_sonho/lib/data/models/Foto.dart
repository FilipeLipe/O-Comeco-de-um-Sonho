class Foto {
  int? id;
  List<int>? foto;
  String? descricao;
  String? dataCaptura;
  int? idConquista;
  int? idDestino;
  int? idInfoCasal;
  int? idMemoria;

  Foto({
    this.id,
    this.foto,
    this.descricao,
    this.dataCaptura,
    this.idConquista,
    this.idDestino,
    this.idInfoCasal,
    this.idMemoria,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto': foto,
      'descricao': descricao,
      'dataCaptura': dataCaptura,
      'idConquista': idConquista,
      'idDestino': idDestino,
      'idInfoCasal': idInfoCasal,
      'idMemoria': idMemoria,
    };
  }

  factory Foto.fromJson(Map<String, dynamic> json) {
    return Foto(
      id: json['id'],
      foto: json['foto'] != null ? List<int>.from(json['foto']) : null,
      descricao: json['descricao'],
      dataCaptura: json['dataCaptura'],
      idConquista: json['idConquista'],
      idDestino: json['idDestino'],
      idInfoCasal: json['idInfoCasal'],
      idMemoria: json['idMemoria'],
    );
  }
}
