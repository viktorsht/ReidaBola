
import 'package:rei_da_bola/app/modules/shared/models/team_model.dart';

class TeamEdition {
  int? id;
  int? teamId;
  int? championshipEditionId;
  int? coachId;
  String? createdAt;
  String? updatedAt;
  Team? team;

  TeamEdition(
      {this.id,
      this.teamId,
      this.championshipEditionId,
      this.coachId,
      this.createdAt,
      this.updatedAt,
      this.team});

  TeamEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    championshipEditionId = json['championship_edition_id'];
    coachId = json['coach_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_id'] = teamId;
    data['championship_edition_id'] = championshipEditionId;
    data['coach_id'] = coachId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}