class RegisterLineUpModel {
  int? teamGameEditionId;
  int? playerLineupId;
  int? championshipRoundId;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  RegisterLineUpModel({
    this.teamGameEditionId,
    this.playerLineupId,
    this.championshipRoundId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id});

  RegisterLineUpModel.fromJson(Map<String, dynamic> json) {
    teamGameEditionId = json['team_game_edition_id'];
    playerLineupId = json['player_lineup_id'];
    championshipRoundId = json['championship_round_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_game_edition_id'] = teamGameEditionId;
    data['player_lineup_id'] = playerLineupId;
    data['championship_round_id'] = championshipRoundId;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
