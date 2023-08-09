import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/register_user/controllers/register_user_controller.dart';
import 'package:rei_da_bola/app/modules/register_user/stories/register_store.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import 'package:rei_da_bola/app/modules/shared/components/password_look.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../design_system/widgets/widget_loading.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = ColorsAppDefault();
    final store = Provider.of<RegisterStore>(context);
    final registerController = Provider.of<RegisterController>(context);
    final formKey = GlobalKey<FormState>();

    String msgUser = 'Ocorreu um erro inesperado, tente mais tarde';

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: colors.green,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagesApp.user),
                const SizedBox(height: 10,),
                const WidgetTextApp(widgetText: 'Registrar',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome',
                    onChanged: store.setFirstNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Sobrenome',
                    onChanged: store.setLastNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome de usuário',
                    onChanged: store.setNick,
                    prefix: Image.asset(IconsApp.arroba),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Email',
                    onChanged: store.setEmail,
                    prefix: Image.asset(IconsApp.email),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Senha',
                    onChanged: store.setPassword,
                    prefix: Image.asset(IconsApp.password),
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
                  builder:(_) {
                    return registerController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9)
                    : TextButton(
                      onPressed: () async {
                        if(!store.isValidFields){
                          msgUser = 'Campos não preenchidos';
                        }
                        else if (!store.isEmailValid){
                          msgUser = 'Email inválido ou não inserido';
                        }
                        else if (!store.isPasswordValid){
                          msgUser = 'A senha inválida! Use mais de 8 dígitos, caractere especial, uma letra maiúscula e um número';
                        }
                        else if(store.isFormValid){
                          await registerController.registerUser(
                            store.firstNameUser, 
                            store.lastNameUser, 
                            store.nick, 
                            store.email, 
                            store.password);
                          if(registerController.stateController == StateResponse.sucess){
                            final snackBar = SnackBar(
                              content: Text('Cadastro concluído com sucesso!', style: TextStyle(color: colors.black),),
                              duration: const Duration(seconds: 3),
                              backgroundColor: colors.white,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            await Future.delayed(const Duration(seconds: 3));
                            //store.clearValues(); // talve possa me gerar aluns bugs se eu apagar ou não os campos e querer usar depois
                            //registerController.cleanFiels();
                            Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                            //Modular.to.navigate(RoutesModulesApp.routerTeamVirtualModule);
                          }
                          else if(registerController.stateController == StateResponse.error){
                            if(registerController.hasEmail && registerController.hasNick){
                              msgUser = "Email e nome de usuário em uso";
                            }
                            else if(registerController.hasNick == true){
                              msgUser = 'Nome de usuário não disponível';
                            }
                            else if(registerController.hasEmail == true){
                              msgUser = 'Email já está em uso em outra conta';
                            }
                          }
                        }
                        if(registerController.stateController != StateResponse.sucess){
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
                          const WidgetTextApp(widgetText: "Registrar",),
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
                      Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Já tenho conta: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.white
                          ),
                        ),
                        Text(
                          "Fazer login",
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