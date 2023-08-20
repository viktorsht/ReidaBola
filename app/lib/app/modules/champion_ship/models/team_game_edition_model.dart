class TeamGameEditionModel {
  int? teamGameId;
  int? championshipEditionId;

  TeamGameEditionModel({this.teamGameId, this.championshipEditionId});

  TeamGameEditionModel.fromJson(Map<String, dynamic> json) {
    teamGameId = json['team_game_id'];
    championshipEditionId = json['championship_edition_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_game_id'] = teamGameId;
    data['championship_edition_id'] = championshipEditionId;
    return data;
  }
}
