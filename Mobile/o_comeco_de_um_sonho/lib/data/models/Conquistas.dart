class Conquistas {
  final int? id;
  final String title;
  final String description;
  final bool achieved;
  final String? imagePath;
  final DateTime? achievedDate;
  final String? location;

  Conquistas({
    this.id,
    required this.title,
    required this.description,
    this.achieved = false,
    this.imagePath,
    this.achievedDate,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'achieved': achieved ? 1 : 0,
      'imagePath': imagePath,
      'achievedDate': achievedDate?.toIso8601String(),
      'location': location,
    };
  }

  factory Conquistas.fromMap(Map<String, dynamic> map) {
    return Conquistas(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      achieved: map['achieved'] == 1,
      imagePath: map['imagePath'],
      achievedDate: map['achievedDate'] != null ? DateTime.parse(map['achievedDate']) : null,
      location: map['location'],
    );
  }
}
