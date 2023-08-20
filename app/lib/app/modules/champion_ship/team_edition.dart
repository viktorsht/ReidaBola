import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/champion_ship/pages/register_champion_ship_page.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';

class TeamEditionModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => RegisterChampionShipPage(teamGameId: args.data)),
  ];

}