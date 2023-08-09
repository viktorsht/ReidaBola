import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/models/buy_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/models/status_lineup_model.dart';

import '../../../../../../shared/models/soccer_match_model.dart';

class PlayerEditionModel {
  int? id;
  int? playerEditionId;
  int? soccerMatchId;
  int? statusLineupId;
  String? createdAt;
  String? updatedAt;
  BuyModel? playerEdition;
  SoccerMatchModel? soccerMatch;
  StatusLineup? statusLineup;

  PlayerEditionModel(
      {this.id,
      this.playerEditionId,
      this.soccerMatchId,
      this.statusLineupId,
      this.createdAt,
      this.updatedAt,
      this.playerEdition,
      this.soccerMatch,
      this.statusLineup});

  PlayerEditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerEditionId = json['player_edition_id'];
    soccerMatchId = json['soccer_match_id'];
    statusLineupId = json['status_lineup_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playerEdition = json['player_edition'] != null
        ? BuyModel.fromJson(json['player_edition'])
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