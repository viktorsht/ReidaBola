import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/models/champion_ship_round.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/models/stadium_football.dart';
import 'package:rei_da_bola/app/modules/shared/models/team_edition.dart';

import '../../start_navigation_bar/modules/more/models/champion_ship_edition.dart';

class SoccerMatchModel {
  int? id;
  String? dateTime;
  int? team1EditionId;
  int? team2EditionId;
  int? championshipEditionId;
  int? stadiumFootballId;
  int? championshipRoundId;
  String? createdAt;
  String? updatedAt;
  TeamEdition? team1Edition;
  TeamEdition? team2Edition;
  ChampionshipEdition? championshipEdition;
  StadiumFootball? stadiumFootball;
  ChampionshipRound? championshipRound;

  SoccerMatchModel(
      {this.id,
      this.dateTime,
      this.team1EditionId,
      this.team2EditionId,
      this.championshipEditionId,
      this.stadiumFootballId,
      this.championshipRoundId,
      this.createdAt,
      this.updatedAt,
      this.team1Edition,
      this.team2Edition,
      this.championshipEdition,
      this.stadiumFootball,
      this.championshipRound});

  SoccerMatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['date_time'];
    team1EditionId = json['team1_edition_id'];
    team2EditionId = json['team2_edition_id'];
    championshipEditionId = json['championship_edition_id'];
    stadiumFootballId = json['stadium_football_id'];
    championshipRoundId = json['championship_round_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    team1Edition = json['team1_edition'] != null
        ? TeamEdition.fromJson(json['team1_edition'])
        : null;
    team2Edition = json['team2_edition'] != null
        ? TeamEdition.fromJson(json['team2_edition'])
        : null;
    championshipEdition = json['championship_edition'] != null
        ? ChampionshipEdition.fromJson(json['championship_edition'])
        : null;
    stadiumFootball = json['stadium_football'] != null
        ? StadiumFootball.fromJson(json['stadium_football'])
        : null;
    championshipRound = json['championship_round'] != null
        ? ChampionshipRound.fromJson(json['championship_round'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_time'] = dateTime;
    data['team1_edition_id'] = team1EditionId;
    data['team2_edition_id'] = team2EditionId;
    data['championship_edition_id'] = championshipEditionId;
    data['stadium_football_id'] = stadiumFootballId;
    data['championship_round_id'] = championshipRoundId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (team1Edition != null) {
      data['team1_edition'] = team1Edition!.toJson();
    }
    if (team2Edition != null) {
      data['team2_edition'] = team2Edition!.toJson();
    }
    if (championshipEdition != null) {
      data['championship_edition'] = championshipEdition!.toJson();
    }
    if (stadiumFootball != null) {
      data['stadium_football'] = stadiumFootball!.toJson();
    }
    if (championshipRound != null) {
      data['championship_round'] = championshipRound!.toJson();
    }
    return data;
  }
}
