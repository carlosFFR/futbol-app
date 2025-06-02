class Coach {
  final int? id;
  final String name;
  final int age;
  final String strategy;
  final int teamId;

  Coach({
    this.id,
    required this.name,
    required this.age,
    required this.strategy,
    required this.teamId,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'age': age,
    'strategy': strategy,
    'team_id': teamId,
  };

  factory Coach.fromMap(Map<String, dynamic> map) => Coach(
    id: map['id'],
    name: map['name'],
    age: map['age'],
    strategy: map['strategy'],
    teamId: map['team_id'],
  );
}
