import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/services/start_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../../../../shared/api/state_response.dart';

part 'start_controller.g.dart';

class StartController = StartControllerImpl with _$StartController;

abstract class StartControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @action
  void setStateController(String value) => stateController = value;

  @observable
  UserModel user = UserModel();

  @observable
  TeamGameModel teamGameModel = TeamGameModel();
  
  @action
  Future<UserModel> drawerUser() async {
    stateController = StateResponse.loading;
    final registerService = StartServices();
    UserModel retorno = UserModel();
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await registerService.postMeProfile(token);
        stateController = StateResponse.sucess;
      } catch (e) {
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }
    return retorno;
  }

  @action
  Future<TeamGameModel> cardProfileUser() async {
    stateController = StateResponse.loading;
    final startServices = StartServices();
    TeamGameModel retorno = TeamGameModel();
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await startServices.getInfoProfileUser(token);
        stateController = StateResponse.sucess;
      } catch (e) {
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }
    return retorno;
  }

  @action
  Future<void> initStartnavigationBar() async {
    user = await drawerUser();
    //teamGameModel = await cardProfileUser();
  }
}