import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../services/login_services.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerImpl with _$LoginController;

abstract class LoginControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @observable
  String stateTeamController = StateResponse.start;

  @observable
  String stateMeController = StateResponse.start;

  @observable
  String token = '';

  @observable
  String idUser = '';

  @computed
  bool get isOkLoading => stateController == StateResponse.sucess && stateMeController == StateResponse.sucess && stateTeamController == StateResponse.sucess;

  @observable
  LoginServices loginService = LoginServices();

  @action
  void setStateController(String value) => stateController = value;

  @action
  Future<String> login(String email, String password) async {
    stateController = StateResponse.loading;
    final body = LoginModel(email: email, password: password);
    try {
      token = await loginService.postLoginApi(body);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
      token = '';
    }
    return token;
  }

  @action
  Future<String> userIdMe(String token) async {
    stateMeController = StateResponse.loading;
    try {
      idUser = (await loginService.checkIdUser(token)).toString();
      stateMeController = StateResponse.sucess;
    } catch (e) {
      stateMeController = StateResponse.error;
    }
    return idUser;
  }

  @action
  Future<TeamGameModel> checkTeamVirtual(String token, String id) async {
    //List<TeamGameModel> team = [];
    TeamGameModel team = TeamGameModel();
    stateTeamController = StateResponse.loading;
    try {
      team = await loginService.getCheckTeamVirtual(token, id);
      stateTeamController = StateResponse.sucess;
    } catch (e) {
      stateTeamController = StateResponse.error;
    }
    return team;
  }
}