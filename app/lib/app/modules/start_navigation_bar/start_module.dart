import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/drawer/drawer_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/home_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/table/table_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';

import '../../routes/routes_app.dart';
import 'modules/more/more_module.dart';

class StartNavigationBarModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => const StartNavigationBarPage()),
    ModuleRoute(RoutesModulesApp.routerHomeModule, module: HomeModule()),
    ModuleRoute(RoutesModulesApp.routerDrawerModule, module: DrawerModule()),
    ModuleRoute(RoutesModulesApp.routerTableModule, module: TableModule()),
    ModuleRoute(RoutesModulesApp.routerMoreModule, module: MoreModule()),
  ];

}