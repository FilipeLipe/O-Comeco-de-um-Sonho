import 'dart:typed_data';

class InfoCasal {
  int? id;
  DateTime? dataInicioNamoro;
  List<int>? foto;

  String? nomeDela;
  DateTime? aniversarioDela;
  String? signoDela;
  String? primeiraLembrancaDela;
  List<String>? qualidadesDela;

  String? nomeDele;
  DateTime? aniversarioDele;
  String? signoDele;
  String? primeiraLembrancaDele;
  List<String>? qualidadesDele;

  String? comoSeConheceram;
  String? primeiroBeijo;
  String? comoFoiPedidodeNamoro;
  String? musicaDoCasal;
  String? restauranteFavoritoCasal;

  InfoCasal({
    this.id,
    this.dataInicioNamoro,
    this.foto,
    this.nomeDela,
    this.aniversarioDela,
    this.signoDela,
    this.primeiraLembrancaDela,
    this.qualidadesDela,
    this.nomeDele,
    this.aniversarioDele,
    this.signoDele,
    this.primeiraLembrancaDele,
    this.qualidadesDele,
    this.comoSeConheceram,
    this.primeiroBeijo,
    this.comoFoiPedidodeNamoro,
    this.musicaDoCasal,
    this.restauranteFavoritoCasal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dataInicioNamoro': dataInicioNamoro?.toIso8601String(),
      'foto': foto,
      'nomeDela': nomeDela,
      'aniversarioDela': aniversarioDela?.toIso8601String(),
      'signoDela': signoDela,
      'primeiraLembrancaDela': primeiraLembrancaDela,
      'qualidadesDela': qualidadesDela != null ? qualidadesDela!.join(",") : null,
      'nomeDele': nomeDele,
      'aniversarioDele': aniversarioDele?.toIso8601String(),
      'signoDele': signoDele,
      'primeiraLembrancaDele': primeiraLembrancaDele,
      'qualidadesDele': qualidadesDele != null ? qualidadesDele!.join(",") : null,
      'comoSeConheceram': comoSeConheceram,
      'primeiroBeijo': primeiroBeijo,
      'comoFoiPedidodeNamoro': comoFoiPedidodeNamoro,
      'musicaDoCasal': musicaDoCasal,
      'restauranteFavoritoCasal': restauranteFavoritoCasal,
    };
  }

  factory InfoCasal.fromMap(Map<String, dynamic> map) {
    return InfoCasal(
      id: map['id'],
      dataInicioNamoro: map['dataInicioNamoro'] != null ? DateTime.parse(map['dataInicioNamoro']) : null,
      foto: map['foto'] != null ? List<int>.from(map['foto']) : null,
      nomeDela: map['nomeDela'],
      aniversarioDela: map['aniversarioDela'] != null ? DateTime.parse(map['aniversarioDela']) : null,
      signoDela: map['signoDela'],
      primeiraLembrancaDela: map['primeiraLembrancaDela'],
      qualidadesDela: map['qualidadesDela'] != null ? map['qualidadesDela'].split(",") : null,
      nomeDele: map['nomeDele'],
      aniversarioDele: map['aniversarioDele'] != null ? DateTime.parse(map['aniversarioDele']) : null,
      signoDele: map['signoDele'],
      primeiraLembrancaDele: map['primeiraLembrancaDele'],
      qualidadesDele: map['qualidadesDele'] != null ? map['qualidadesDele'].split(",") : null,
      comoSeConheceram: map['comoSeConheceram'],
      primeiroBeijo: map['primeiroBeijo'],
      comoFoiPedidodeNamoro: map['comoFoiPedidodeNamoro'],
      musicaDoCasal: map['musicaDoCasal'],
      restauranteFavoritoCasal: map['restauranteFavoritoCasal'],
    );
  }
}
