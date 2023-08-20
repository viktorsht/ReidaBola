import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'pages/lineup_page.dart';

class LineUpModule extends Module {
  @override
  List<Bind> get binds => [
    //Bind((i) => null)
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (_, args) => 
    LineUpPage(
      position: args.data['position'],
      round: args.data['round'],
      edition: args.data['edition'],
      )
    ),
  ];

}