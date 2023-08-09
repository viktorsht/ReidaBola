import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../routes/routes_app.dart';
import 'pages/drawer_page.dart';


class DrawerModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule, child: (_, args) => DrawerPage(
        colors: ColorsAppDefault(), 
        user: UserModel(),
      )
    ),  
  ];

}