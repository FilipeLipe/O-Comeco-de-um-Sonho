class Memorias {
  final int? id;
  final DateTime date;
  final String description;
  final String? imagePath;

  Memorias({
    this.id,
    required this.date,
    required this.description,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'description': description,
      'imagePath': imagePath,
    };
  }

  factory Memorias.fromMap(Map<String, dynamic> map) {
    return Memorias(
      id: map['id'],
      date: DateTime.parse(map['date']),
      description: map['description'],
      imagePath: map['imagePath'],
    );
  }
}
