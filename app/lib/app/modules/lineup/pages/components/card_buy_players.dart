import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/lineup/models/lu_player_lineup_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/stories/football_field_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';

import '../../../../routes/routes_app.dart';
import '../../../shared/config/config_controller.dart';
import '../../../shared/score/stories/score_store.dart';
import '../../controllers/lineup_controller.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  final PlayerLineUpModel player;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.image, 
    //required this.score,
    required this.player, 
  });

  @override
  Widget build(BuildContext context) {
    final configController = Provider.of<ConfigController>(context);
    final lineupController = Provider.of<LineUpController>(context);
    final scoreStore = Provider.of<ScoreStore>(context);
    final footballFieldStore = Provider.of<FootballFieldStore>(context);
    //final pageViewController = PageController();
    return Container(
      decoration: BoxDecoration(
        color: color.whiteLigth,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.playerEdition?.player?.firstName == null || player.playerEdition?.player?.lastName == null
                ? 'Carregando...' 
                : '${player.playerEdition?.player!.firstName!} ${player.playerEdition?.player?.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                //'$positionAbb - $nameTeam',
                player.playerEdition?.teamEdition?.team?.name == null || player.playerEdition?.player?.position?.abb == null
                ? 'Carregando...' 
                : '${player.playerEdition?.player?.position?.abb} - ${player.playerEdition?.teamEdition?.team?.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Image.asset(IconsApp.rankPretoPequeno),
              Text(
                '${player.score}',
                //'Id=${player.score}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              /*const Text(
                'pts',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),*/
            ],
          ),
          Observer(
            builder:(_) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                // talvez seja preciso mudar a cor do botão dependendo do valor que o cara tiver
                backgroundColor: color.green, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: footballFieldStore.isValidButton(player.id!) 
              ? null
              : () {
                lineupController.setStatus(player.statusLineupId);
                configController.listPlayerLineUp(player);
                scoreStore.incrementScore(player.score!);
                //print(footballFieldStore.isValidButton(player.id!));
                //Navigator.pop(context);
                Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                //Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                //Modular.to.pushNamed(RoutesModulesApp.routerFootbolFielModule);
              },
              child: const Text(
                "COMPRAR",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}