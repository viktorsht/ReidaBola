import '../../shared/models/soccer_match_model.dart';
import '../../start_navigation_bar/modules/football_field/models/player_edition_model.dart';
import 'status_line_up.dart';

class PlayerLineUpModel {
  int? id;
  int? playerEditionId;
  int? soccerMatchId;
  int? statusLineupId;
  String? createdAt;
  String? updatedAt;
  String? score;
  int? matchLineupId;
  PlayerEditionModel? playerEdition;
  SoccerMatchModel? soccerMatch;
  StatusLineup? statusLineup;

  PlayerLineUpModel(
      {this.id,
      this.playerEditionId,
      this.soccerMatchId,
      this.statusLineupId,
      this.createdAt,
      this.updatedAt,
      this.score,
      this.matchLineupId,
      this.playerEdition,
      this.soccerMatch,
      this.statusLineup});

  PlayerLineUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerEditionId = json['player_edition_id'];
    soccerMatchId = json['soccer_match_id'];
    statusLineupId = json['status_lineup_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    score = json['score'];
    matchLineupId = json['match_lineup_id'];
    playerEdition = json['player_edition'] != null
        ? PlayerEditionModel.fromJson(json['player_edition'])
        : null;
    soccerMatch = json['soccer_match'] != null
        ? SoccerMatchModel.fromJson(json['soccer_match'])
        : null;
    statusLineup = json['status_lineup'] != null
        ? StatusLineup.fromJson(json['status_lineup'])
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
    data['score'] = score;
    data['match_lineup_id'] = matchLineupId;
    if (playerEdition != null) {
      data['player_edition'] = playerEdition!.toJson();
    }
    if (soccerMatch != null) {
      data['soccer_match'] = soccerMatch!.toJson();
    }
    if (statusLineup != null) {
      data['status_lineup'] = statusLineup!.toJson();
    }
    return data;
  }
}