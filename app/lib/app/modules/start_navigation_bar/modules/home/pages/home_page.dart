import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/components/card_profile/card_profile.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'components/buttons/climb_now.dart';
import 'components/card_info/featured_player.dart';
import 'components/buttons/next_round.dart';
import 'components/card_info/patrimony.dart';
import 'components/card_info/punctuations.dart';

class HomePage extends StatelessWidget {

  final TeamGameModel teamGameModel;
  final SoccerMatchModel soccerMatchModel;
  final PageController pageController;
  
  const HomePage({
    super.key, 
    required this.teamGameModel, 
    required this.pageController, 
    required this.soccerMatchModel
  });  
  
  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40,),
          Observer(
            builder:(_) => CardProfile(
              //teamGameModel: cardHome.teamGameModel[0],
              teamGameModel: teamGameModel,
            )
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Punctuations(
                colors: colors,
                height: 100,
                width: 120,
                punctuation: "75,15",
              ),
              Patrimony(
                colors: colors,
                height: 100,
                width: 120,
                patrimonyValue: "141,15",
              ),
              FeaturedPlayer(
                colors: colors,
                height: 100,
                width: 120,
                namePlayer: 'Ciclano',
                playerPoints: '23,7', 
              ),
            ],
          ),
          const SizedBox(height: 40,),
          ClimbNowButton(
            onPressed: (){
              pageController.jumpToPage(2); // ele leva para o TeamPage() do navigationbar
              
            },
            heightClimbNowButton: 60,
            widthClimbNowButton: 350,
            text: "ESCALAR AGORA",
            colors: colors,
          ),
          const SizedBox(height: 30,),
          Observer(
            builder:(_) => NextRoundButton(
              colors: colors, 
              heightNextRoundButton: 80,
              widthNextRoundButton: 350,
              onPressed: (){},
              numberRound: soccerMatchModel.championshipRound?.name == null ? 'Carregando...' : soccerMatchModel.championshipRound!.name!,
              timeRound: '2d 13h 27m',
            ),
          )
        ],
      )
    );
  }
}