class InfoCasal {
  final int? id;
  final DateTime startDate;
  final String? additionalInfo;

  InfoCasal({
    this.id,
    required this.startDate,
    this.additionalInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startDate': startDate.toIso8601String(),
      'additionalInfo': additionalInfo,
    };
  }

  factory InfoCasal.fromMap(Map<String, dynamic> map) {
    return InfoCasal(
      id: map['id'],
      startDate: DateTime.parse(map['startDate']),
      additionalInfo: map['additionalInfo'],
    );
  }
}
