import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/error.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_model.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_sucess_model.dart';

import '../../../../shared/api/state_response.dart';
import '../services/register_services.dart';

part 'register_user_controller.g.dart';

class RegisterController = RegisterControllerImpl with _$RegisterController;

abstract class RegisterControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @action
  void setStateController(String value) => stateController = value;

  @observable
  bool hasEmail = false;

  @observable
  bool hasNick = false;
  
  @observable
  int? userId;

  @action
  void cleanFiels(){
    stateController = StateResponse.start;
    hasEmail = false;
    hasNick = false;
  }

  @action
  void contarElementosNoJSON(dynamic exception) {
    if (exception is ErrorRegisterExceptionModel) {
      Map<String, dynamic> errors = exception.errors;


      if (errors.containsKey('nick')) {
        hasNick = true;
      }

      if (errors.containsKey('email')) {
        hasEmail = true;
      }
    }
  }

  @action
  Future<RegisterUserSucessModel> registerUser(String firstNameUser, String lastNameUser, String nick, String email, String password) async {
    stateController = StateResponse.loading;
    final registerService = RegisterServices();
    RegisterUserSucessModel retorno = RegisterUserSucessModel();
    final body = RegisterUserModel(firstName: firstNameUser,lastName: lastNameUser,nick: nick,email: email,password: password);
    try {
      retorno = await registerService.postRegisterUserApi(body);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
      contarElementosNoJSON(e);
      //rethrow;
      //final erro = Errors.fromJson(e.toString());
    }
    return retorno;
  }
}