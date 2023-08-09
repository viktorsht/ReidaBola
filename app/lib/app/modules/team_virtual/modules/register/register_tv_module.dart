import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/team_virtual/modules/register/pages/team_virtual_register_page.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';

class TeamVirtualRegisterModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule, 
      child: (_, args) => TeamVirtualRegisterPage(user: args.data,)
    ),
  ];

}