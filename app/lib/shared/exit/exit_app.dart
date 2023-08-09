import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../../app/routes/routes_app.dart';

class ExitApp{

  final tokenManager = TokenManager();
  
  Future<void> exitToApp() async {
    await tokenManager.removeToken();
    SystemNavigator.pop();
  }

  Future<void> changeAccount() async {
    await tokenManager.removeToken();
    Modular.to.navigate(RoutesModulesApp.routerLoginModule);
  }
  
}