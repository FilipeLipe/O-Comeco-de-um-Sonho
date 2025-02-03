class InfoCasal {
  final int? id;
  final DateTime dataInicio;
  final String? textoCasal;

  InfoCasal({
    this.id,
    required this.dataInicio,
    this.textoCasal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dataInicio': dataInicio.toIso8601String(),
      'textoCasal': textoCasal,
    };
  }

  factory InfoCasal.fromMap(Map<String, dynamic> map) {
    return InfoCasal(
      id: map['id'],
      dataInicio: DateTime.parse(map['dataInicio']),
      textoCasal: map['textoCasal'],
    );
  }
}
