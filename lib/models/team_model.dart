class Team {
  final int? id;
  final String name;
  final String? image;
  final int wins;

  Team({
    this.id,
    required this.name,
    this.image,
    this.wins = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image_path': image,
      'wins': wins,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      image: map['image_path'],
      wins: map['wins'] ?? 0,
    );
  }
}
