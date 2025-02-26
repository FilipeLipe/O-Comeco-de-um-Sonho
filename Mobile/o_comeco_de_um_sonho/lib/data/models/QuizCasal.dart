class QuizCasal {
  int? id;

  String? ComidaFavoritaDele;
  String? ComidaFavoritaDela;
  String? EstiloMusicalFavoritoDele;
  String? EstiloMusicalFavoritoDela;
  String? FilmeSerieFavoritaDele;
  String? FilmeSerieFavoritaDela;
  String? HobbiesDele;
  String? HobbiesDela;
  String? TimeFutebolDele;
  String? TimeFutebolDela;
  String? MelhorAmigoDele;
  String? MelhorAmigaDela;

  String? QuemMaisOrganizado;
  String? QuemCozinhaMelhor;
  String? QuemDormeMais;
  String? QuemGastaMaisDinheiro;
  String? PiorHabitoCadaUm;
  String? QuemTomaMaisDecisoesCasal;
  String? ViagemMaisMemoravelJuntos;

  QuizCasal({
    this.id,
    this.ComidaFavoritaDele,
    this.ComidaFavoritaDela,
    this.EstiloMusicalFavoritoDele,
    this.EstiloMusicalFavoritoDela,
    this.FilmeSerieFavoritaDele,
    this.FilmeSerieFavoritaDela,
    this.HobbiesDele,
    this.HobbiesDela,
    this.TimeFutebolDele,
    this.TimeFutebolDela,
    this.MelhorAmigoDele,
    this.MelhorAmigaDela,
    this.QuemMaisOrganizado,
    this.QuemCozinhaMelhor,
    this.QuemDormeMais,
    this.QuemGastaMaisDinheiro,
    this.PiorHabitoCadaUm,
    this.QuemTomaMaisDecisoesCasal,
    this.ViagemMaisMemoravelJuntos,
  });

  // Converte a instância em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ComidaFavoritaDele': ComidaFavoritaDele,
      'ComidaFavoritaDela': ComidaFavoritaDela,
      'EstiloMusicalFavoritoDele': EstiloMusicalFavoritoDele,
      'EstiloMusicalFavoritoDela': EstiloMusicalFavoritoDela,
      'FilmeSerieFavoritaDele': FilmeSerieFavoritaDele,
      'FilmeSerieFavoritaDela': FilmeSerieFavoritaDela,
      'HobbiesDele': HobbiesDele,
      'HobbiesDela': HobbiesDela,
      'TimeFutebolDele': TimeFutebolDele,
      'TimeFutebolDela': TimeFutebolDela,
      'MelhorAmigoDele': MelhorAmigoDele,
      'MelhorAmigaDela': MelhorAmigaDela,
      'QuemMaisOrganizado': QuemMaisOrganizado,
      'QuemCozinhaMelhor': QuemCozinhaMelhor,
      'QuemDormeMais': QuemDormeMais,
      'QuemGastaMaisDinheiro': QuemGastaMaisDinheiro,
      'PiorHabitoCadaUm': PiorHabitoCadaUm,
      'QuemTomaMaisDecisoesCasal': QuemTomaMaisDecisoesCasal,
      'ViagemMaisMemoravelJuntos': ViagemMaisMemoravelJuntos,
    };
  }

  // Cria uma instância de InfoCasal a partir de um Map<String, dynamic>
  factory QuizCasal.fromMap(Map<String, dynamic> map) {
    return QuizCasal(
      id: map['id'] as int?,
      ComidaFavoritaDele: map['ComidaFavoritaDele'] as String,
      ComidaFavoritaDela: map['ComidaFavoritaDela'] as String,
      EstiloMusicalFavoritoDele: map['EstiloMusicalFavoritoDele'] as String,
      EstiloMusicalFavoritoDela: map['EstiloMusicalFavoritoDela'] as String,
      FilmeSerieFavoritaDele: map['FilmeSerieFavoritaDele'] as String,
      FilmeSerieFavoritaDela: map['FilmeSerieFavoritaDela'] as String,
      HobbiesDele: map['HobbiesDele'] as String,
      HobbiesDela: map['HobbiesDela'] as String,
      TimeFutebolDele: map['TimeFutebolDele'] as String,
      TimeFutebolDela: map['TimeFutebolDela'] as String,
      MelhorAmigoDele: map['MelhorAmigoDele'] as String,
      MelhorAmigaDela: map['MelhorAmigaDela'] as String,
      QuemMaisOrganizado: map['QuemMaisOrganizado'] as String,
      QuemCozinhaMelhor: map['QuemCozinhaMelhor'] as String,
      QuemDormeMais: map['QuemDormeMais'] as String,
      QuemGastaMaisDinheiro: map['QuemGastaMaisDinheiro'] as String,
      PiorHabitoCadaUm: map['PiorHabitoCadaUm'] as String,
      QuemTomaMaisDecisoesCasal: map['QuemTomaMaisDecisoesCasal'] as String,
      ViagemMaisMemoravelJuntos: map['ViagemMaisMemoravelJuntos'] as String,
    );
  }
}

