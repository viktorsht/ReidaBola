import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import '../../../../../shared/token/token_manager.dart';
import '../services/user_services.dart';

part 'user_controller.g.dart';

class UserController = UserControllerImpl with _$UserController;

abstract class UserControllerImpl with Store{

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

  @observable
  UserServices userService = UserServices();

  @observable
  TeamGameModel team = TeamGameModel();

  @action
  Future<String> userIdMe(String token) async {
    stateMeController = StateResponse.loading;
    try {
      idUser = (await userService.checkIdUser(token)).toString();
      stateMeController = StateResponse.sucess;
    } catch (e) {
      stateMeController = StateResponse.error;
    }
    return idUser;
  }

  @action
  Future<TeamGameModel> checkTeamVirtual(String token, String id) async {
    //List<TeamGameModel> team = [];
    TeamGameModel retorno = TeamGameModel();
    stateTeamController = StateResponse.loading;
    try {
      retorno = await userService.getCheckTeamVirtual(token, id);
      stateTeamController = StateResponse.sucess;
    } catch (e) {
      stateTeamController = StateResponse.error;
    }
    return retorno;
  }

  @action
  Future<void> initUserInfomations() async {
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      String idUser = await userIdMe(token);
      team = await checkTeamVirtual(token, idUser);
    }
  }

}