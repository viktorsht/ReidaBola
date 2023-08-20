class TeamGameEditionSucessModel {
  int? teamGameId;
  int? championshipEditionId;
  String? updatedAt;
  String? createdAt;
  int? id;

  TeamGameEditionSucessModel(
      {this.teamGameId,
      this.championshipEditionId,
      this.updatedAt,
      this.createdAt,
      this.id});

  TeamGameEditionSucessModel.fromJson(Map<String, dynamic> json) {
    teamGameId = json['team_game_id'];
    championshipEditionId = json['championship_edition_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_game_id'] = teamGameId;
    data['championship_edition_id'] = championshipEditionId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
