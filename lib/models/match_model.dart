class Match {
  final int? id;
  final int teamAId;
  final int teamBId;
  final int winnerId;
  final String matchDate;

  Match({
    this.id,
    required this.teamAId,
    required this.teamBId,
    required this.winnerId,
    required this.matchDate,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'team_a_id': teamAId,
    'team_b_id': teamBId,
    'winner_id': winnerId,
    'match_date': matchDate,
  };

  factory Match.fromMap(Map<String, dynamic> map) => Match(
    id: map['id'],
    teamAId: map['team_a_id'],
    teamBId: map['team_b_id'],
    winnerId: map['winner_id'],
    matchDate: map['match_date'],
  );
}
