/*import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/controller/more_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/pages/more_page.dart';

import '../../../../routes/routes_app.dart';

class MoreModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => MorePage(moreController: i(),))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule, child: (_, args) => MorePage(moreController: MoreController(),)),  
  ];

}
*/

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/controller/more_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/pages/more_page.dart';

class MoreModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => MoreController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const MorePage()),
  ];
}

