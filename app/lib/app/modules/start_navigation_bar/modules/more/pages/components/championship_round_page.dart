import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../design_system/widgets/card_game_round.dart';
import '../../../../../../../shared/format_date_time.dart';

class ChampionshipRoundPage extends StatelessWidget {
  final int round;
  final List<SoccerMatchModel> listRound;
  const ChampionshipRoundPage({
    super.key, 
    required this.round, 
    required this.listRound
  });

  @override
  Widget build(BuildContext context) {
    final data = DateFormateAppDefault();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$roundº Rodada',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listRound.length,
            itemBuilder: (context, index){
              if(round == listRound[index].championshipRoundId){
                return CardGameRound(
                  color: ColorsAppDefault(),
                  pathFristTeam: ImagesApp.escudoTeam,
                  nameFristTeam: listRound[index].team1Edition!.team!.name!,
                  pathSecondTeam: ImagesApp.escudoTeam,
                  nameSecondTeam: listRound[index].team2Edition!.team!.name!,
                  gameTime: data.formatDateTime(listRound[index].dateTime!),
                );
              }
              else{
                return Container();
              }
            }
          ),
        ),
      ],
    );
  }
}