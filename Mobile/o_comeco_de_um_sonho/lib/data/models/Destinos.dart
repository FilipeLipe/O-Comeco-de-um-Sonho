class Destinos {
  final int? id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String? imagePath;
  final bool visited;

  Destinos({
    this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    this.imagePath,
    this.visited = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'imagePath': imagePath,
      'visited': visited ? 1 : 0,
    };
  }

  factory Destinos.fromMap(Map<String, dynamic> map) {
    return Destinos(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      imagePath: map['imagePath'],
      visited: map['visited'] == 1,
    );
  }
}
