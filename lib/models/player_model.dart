class Player {
  final int? id;
  final String name;
  final String position;
  final int shirtNumber;
  final int age;
  final int teamId;

  Player({
    this.id,
    required this.name,
    required this.position,
    required this.shirtNumber,
    required this.age,
    required this.teamId,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'position': position,
    'shirt_number': shirtNumber,
    'age': age,
    'team_id': teamId,
  };

  factory Player.fromMap(Map<String, dynamic> map) => Player(
    id: map['id'],
    name: map['name'],
    position: map['position'],
    shirtNumber: map['shirt_number'],
    age: map['age'],
    teamId: map['team_id'],
  );
}
