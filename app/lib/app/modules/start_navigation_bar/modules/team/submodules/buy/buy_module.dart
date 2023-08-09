import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/pages/buy_page.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';

class BuyModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (_, args) => BuyPage(position: args.data)),
  ];

}