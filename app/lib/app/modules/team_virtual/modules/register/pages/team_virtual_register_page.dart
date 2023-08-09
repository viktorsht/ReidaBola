import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../../../../design_system/icons/icons_app.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import '../../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../../../shared/api/state_response.dart';
import '../controller/register_team_virtual_controller.dart';
import '../model/register_team_virtual_sucess_model.dart';
import '../stories/team_virtual_register_store.dart';

class TeamVirtualRegisterPage extends StatelessWidget {
  final int user;
  const TeamVirtualRegisterPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final store = Provider.of<TeamVirtualRegisterStore>(context);
    //final storeRegisterUserId = Provider.of<RegisterController>(context);
    final registerTVController = Provider.of<RegisterTeamVirtualController>(context);
    String msgUser = 'Ocorreu um erro inesperado, tente mais tarde';
    return Scaffold(
      backgroundColor: colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(ImagesApp.logo),
            //const SizedBox(height: 16,),
            Text(
              "Cadastre seu time virtual!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.white,
              ),
            ),
            const SizedBox(height: 16,),
            Text(
              "Falta apenas esta etapa para concluir o cadastro",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: colors.white,
              ),
            ),
            const SizedBox(height: 50,),
            WidgetFormField(
              hint: 'Nome do time' ,
              textInputType: TextInputType.emailAddress,
              prefix: Image.asset(IconsApp.team),
              obscure: false,
              enable: true,
              onChanged: store.setNameTeam,
            ),
            const SizedBox(height: 16,),
            WidgetFormField(
              hint: 'Abreviação do time' ,
              textInputType: TextInputType.emailAddress,
              prefix: Image.asset(IconsApp.team),
              obscure: false,
              enable: true,
              onChanged: store.setAbbreviationTeam,
            ),
            const SizedBox(height: 16,),
            Observer(
            builder:(_) {
              return registerTVController.stateController == StateResponse.loading
                ? const WidgetLoading(width: 5, thickness: 0.9)
                : TextButton(
                  onPressed: () async {
                    if(!store.isValidFields){
                      msgUser = 'Campos não preenchidos';
                    }
                    else if (!store.isNameTeamValid){
                      msgUser = 'Nome inválido ou não inserido';
                    }
                    else if (!store.isAbbreviationTeam){
                      msgUser = 'Abreviação inválida! Use apenas 3 letras';
                    }
                    if(store.isValidFields){
                      RegisterTeamVirtualSucessModel retorno = await registerTVController.registerTeamVirtual(store.nameTeam, store.abbreviationTeam, user);
                      if(registerTVController.stateController == StateResponse.sucess){
                        final snackBar = SnackBar(
                          content: Text('Cadastro do time concluído com sucesso!', style: TextStyle(color: colors.black),),
                          duration: const Duration(seconds: 3),
                          backgroundColor: colors.white,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        await Future.delayed(const Duration(seconds: 3));
                        Modular.to.navigate(RoutesModulesApp.routerRegisterTeamEditionModule, arguments:retorno.id);
                      }
                      else if (registerTVController.stateController == StateResponse.error){
                        if(registerTVController.hasName && registerTVController.hasAbb){
                          msgUser = "Nome e abreviação do time em uso";
                        }
                        else if(registerTVController.hasName == true){
                          msgUser = 'Nome do time não disponível';
                        }
                        else if(registerTVController.hasAbb == true){
                          msgUser = 'Abreviação já está em uso em outra conta';
                        }
                      }
                    }
                    if(registerTVController.stateController != StateResponse.sucess){
                          // quero evitar o bug de colocar o SnackBar de sucesso e depois de um erro qualquer 
                          final snackBar = SnackBar(
                            content: Text(
                              msgUser,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                              ),
                            ),      
                            duration: const Duration(seconds: 3),
                            backgroundColor: colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const WidgetTextApp(widgetText: "Continuar",),
                        const SizedBox(width: 10,),
                        Image.asset(ImagesApp.entrarWhite),
                    ],
                  ),
                );
              },
            )
          ]
        ),
      ),
    );
  }
}