import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/team_virtual/modules/register/register_tv_module.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';

class TeamVirtualModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    //ChildRoute('/', child: (context, args) => const RegisterPage()),
    ModuleRoute(RoutesModulesApp.routerRootModule, module: TeamVirtualRegisterModule()),
  ];

}