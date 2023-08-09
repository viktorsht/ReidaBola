import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/team_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/stories/buy_store.dart';
//import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/buy_module.dart';

import '../../../../routes/routes_app.dart';

class TeamModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => BuyStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (_, args) => const TeamPage()),  
    //ModuleRoute('/buy', module: BuyModule()),
  ];

}