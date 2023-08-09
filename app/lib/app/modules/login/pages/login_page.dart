import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/login/stories/login_store.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../design_system/widgets/widget_snackbar.dart';
import '../../../../shared/token/token_manager.dart';
import '../../../routes/routes_app.dart';
import '../../shared/components/password_look.dart';
import '../../start_navigation_bar/modules/home/controller/card_profile_controller.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LoginStore>(context);
    final loginController = Provider.of<LoginController>(context);
    final colors = ColorsAppDefault();
    final tokenManager = TokenManager();
    //final heightRegister = MediaQuery.of(context).size.height * 0.2;
    //final loginController = LoginController();
    return Form(
      child: Scaffold(
        backgroundColor: colors.green,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagesApp.user),
                const SizedBox(height: 10,),
                const WidgetTextApp(widgetText: 'Login',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Email' ,
                    textInputType: TextInputType.emailAddress,
                    prefix: Image.asset(IconsApp.email),
                    obscure: false,
                    enable: true,
                    onChanged: store.setEmail,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Senha',
                    prefix: Image.asset(IconsApp.password),
                    onChanged: store.setPassword,
                    obscure: !store.passwordLook,
                    enable: true,
                    suffix: PasswordLook(
                      onPressed: store.togglePasswordLook,
                      iconData: store.passwordLook ? 
                      Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded 
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) {
                    return loginController.stateController == StateResponse.loading || loginController.stateTeamController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9) 
                    : TextButton(
                      onPressed: () async {
                        if(store.isFormValid){
                          String token = await loginController.login(store.email, store.password);
                          if(loginController.stateController == StateResponse.sucess){
                            await tokenManager.setToken(token);
                            String idUser = await loginController.userIdMe(token);
                            //List<TeamGameModel> team = [];
                            TeamGameModel team = await loginController.checkTeamVirtual(token, idUser);
                            if(loginController.stateTeamController == StateResponse.sucess){
                              final cardHome = CardProfileController();
                              cardHome.setTeamGameModel(team);
                              Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                            }
                            else if(loginController.stateTeamController != StateResponse.sucess){
                              Modular.to.navigate(RoutesModulesApp.routerTeamVirtualModule, arguments: int.parse(idUser));
                            }
                            //print(team[0].name);
                            /*
                            else{
                              Modular.to.navigate(RoutesModulesApp.routerTeamVirtualRegisterModule);
                            }
                            final cardProfileController = CardProfileController(); // esta aqui pro causa do Drawer
                            //await cardProfileController.infoProfileUser(tokenManager);
                            if(cardProfileController.hasTeam == false){
                              Modular.to.navigate(RoutesModulesApp.routerTeamVirtualRegisterModule);
                            }
                            Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                            */
                          }
                          else{
                            // resolver este warnnig depois
                            WidgetSnackBar.show(
                              context: context,
                              message: 'Email ou senha incorretos',
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            );
                          }
                        }
                        else{
                          final snackBar = SnackBar(
                            content: const Text('Email ou senha inválidos'),
                            duration: const Duration(seconds: 3),
                            backgroundColor: colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const WidgetTextApp(widgetText: "Entrar",),
                          const SizedBox(width: 10,),
                          Image.asset(ImagesApp.entrarWhite),
                        ],
                      )
                    );
                  }
                ),
                const SizedBox(height: 16,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: (){
                      Modular.to.navigate(RoutesModulesApp.routerRegisterModule);
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Não tenho conta: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.white
                          ),
                        ),
                        Text(
                          "Registrar-se",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}