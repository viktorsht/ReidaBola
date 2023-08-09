class MatchGameLineUpModel {
  int? id;
  int? teamGameEditionId;
  int? playerLineupId;
  int? championshipRoundId;
  int? status;
  String? createdAt;
  String? updatedAt;
  TeamGameEdition? teamGameEdition;
  PlayerLineup? playerLineup;
  ChampionshipRound? championshipRound;

  MatchGameLineUpModel(
      {this.id,
      this.teamGameEditionId,
      this.playerLineupId,
      this.championshipRoundId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.teamGameEdition,
      this.playerLineup,
      this.championshipRound});

  MatchGameLineUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameEditionId = json['team_game_edition_id'];
    playerLineupId = json['player_lineup_id'];
    championshipRoundId = json['championship_round_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamGameEdition = json['team_game_edition'] != null
        ? TeamGameEdition.fromJson(json['team_game_edition'])
        : null;
    playerLineup = json['player_lineup'] != null
        ? PlayerLineup.fromJson(json['player_lineup'])
        : null;
    championshipRound = json['championship_round'] != null
        ? ChampionshipRound.fromJson(json['championship_round'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_game_edition_id'] = teamGameEditionId;
    data['player_lineup_id'] = playerLineupId;
    data['championship_round_id'] = championshipRoundId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (teamGameEdition != null) {
      data['team_game_edition'] = teamGameEdition!.toJson();
    }
    if (playerLineup != null) {
      data['player_lineup'] = playerLineup!.toJson();
    }
    if (championshipRound != null) {
      data['championship_round'] = championshipRound!.toJson();
    }
    return data;
  }
}

class TeamGameEdition {
  int? id;
  int? teamGameId;
  int? championshipEditionId;
  String? createdAt;
  String? updatedAt;

  TeamGameEdition(
      {this.id,
      this.teamGameId,
      this.championshipEditionId,
      this.createdAt,
      this.updatedAt});

  TeamGameEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameId = json['team_game_id'];
    championshipEditionId = json['championship_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_game_id'] = teamGameId;
    data['championship_edition_id'] = championshipEditionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PlayerLineup {
  int? id;
  int? playerEditionId;
  int? soccerMatchId;
  int? statusLineupId;
  String? createdAt;
  String? updatedAt;
  PlayerEdition? playerEdition;

  PlayerLineup(
      {this.id,
      this.playerEditionId,
      this.soccerMatchId,
      this.statusLineupId,
      this.createdAt,
      this.updatedAt,
      this.playerEdition});

  PlayerLineup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerEditionId = json['player_edition_id'];
    soccerMatchId = json['soccer_match_id'];
    statusLineupId = json['status_lineup_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playerEdition = json['player_edition'] != null
        ? PlayerEdition.fromJson(json['player_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['player_edition_id'] = playerEditionId;
    data['soccer_match_id'] = soccerMatchId;
    data['status_lineup_id'] = statusLineupId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (playerEdition != null) {
      data['player_edition'] = playerEdition!.toJson();
    }
    return data;
  }
}

class PlayerEdition {
  int? id;
  int? playerId;
  int? teamEditionId;
  String? createdAt;
  String? updatedAt;
  Player? player;

  PlayerEdition(
      {this.id,
      this.playerId,
      this.teamEditionId,
      this.createdAt,
      this.updatedAt,
      this.player});

  PlayerEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    teamEditionId = json['team_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player =
        json['player'] != null ? Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['player_id'] = playerId;
    data['team_edition_id'] = teamEditionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    return data;
  }
}

class Player {
  int? id;
  String? firstName;
  String? lastName;
  int? number;
  int? positionId;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  Position? position;

  Player(
      {this.id,
      this.firstName,
      this.lastName,
      this.number,
      this.positionId,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.position});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    number = json['number'];
    positionId = json['position_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    position = json['position'] != null
        ? Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['number'] = number;
    data['position_id'] = positionId;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    return data;
  }
}

class Position {
  int? id;
  String? name;
  String? abb;
  String? createdAt;
  String? updatedAt;

  Position({this.id, this.name, this.abb, this.createdAt, this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ChampionshipRound {
  int? id;
  String? name;
  int? round;
  String? createdAt;
  String? updatedAt;

  ChampionshipRound(
      {this.id, this.name, this.round, this.createdAt, this.updatedAt});

  ChampionshipRound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    round = json['round'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['round'] = round;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
