import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/design_system/buttons/app_butons.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../design_system/widgets/widget_text_app.dart';
import '../../routes/routes_app.dart';

class StartInfoPage extends StatefulWidget {
  const StartInfoPage({super.key});

  @override
  State<StartInfoPage> createState() => _StartInfoPageState();
}

class _StartInfoPageState extends State<StartInfoPage> {
  @override
  Widget build(BuildContext context) {
    final colorsApp = ColorsAppDefault();
    final buttonApp = ButtonAppDefault();
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorsApp.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesApp.logo),
              WidgetTextApp(
                widgetText: 'Domine o campo e',
                color: colorsApp.white,
              ),
              WidgetTextApp(
                widgetText: 'conquiste a coroa.',
                color: colorsApp.white,
              ),
              
              const SizedBox(height: 100,),
              ElevatedButton(
                style: buttonApp.themeButtonAppPrimary,
                onPressed: () {
                  Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                }, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Entrar", 
                      style: TextStyle(fontSize: 32, color: colorsApp.green),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(ImagesApp.entrar,),
                  ],
                ),  
              ),
              TextButton(
                onPressed: (){
                  Modular.to.navigate(RoutesModulesApp.routerRegisterModule);
                }, 
                child: Text(
                  'Cadastre-se', 
                  style: TextStyle(
                    color: colorsApp.white,
                    fontSize: 20
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}