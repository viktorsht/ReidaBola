import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';

import '../../../../routes/routes_app.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => PageController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule, child: (context, args) => HomePage(
        teamGameModel: TeamGameModel(),
        pageController: PageController(), 
        soccerMatchModel: SoccerMatchModel(),
      )
    ),
  ];

}