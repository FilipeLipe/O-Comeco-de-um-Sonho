class Calendario {
  final int? id;
  final String title;
  final DateTime date;
  final String? description;

  Calendario({
    this.id,
    required this.title,
    required this.date,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'description': description,
    };
  }

  factory Calendario.fromMap(Map<String, dynamic> map) {
    return Calendario(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      description: map['description'],
    );
  }
}
