import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/services/card_profile_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../../../../../../shared/api/state_response.dart';


part 'card_profile_controller.g.dart';

class CardProfileController = CardProfileControllerImpl with _$CardProfileController;

abstract class CardProfileControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @observable
  UserModel user = UserModel();

  @observable
  bool hasTeam = false;

  @observable
  TeamGameModel teamGameModel = TeamGameModel();

  @action
  void setTeamGameModel(value) => teamGameModel = value;

  @action
  TeamGameModel getTeamGameModel() => teamGameModel;
   
  @action
  void cleanField(){
    stateController = '';
  }

  @action
  Future<UserModel> profile(TokenManager tokenManager) async {
    String token = (await tokenManager.getToken())!;
    stateController = StateResponse.loading;
    final cardProfileService = CardProfileServices();
    UserModel user = UserModel();
    try {
      user = await cardProfileService.postCardProfileServices(token);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
    }
    return user;
  }

  @action
  Future<TeamGameModel> infoProfileUser(TokenManager tokenManager) async {
    String token = (await tokenManager.getToken())!;
    stateController = StateResponse.loading;
    final cardProfileService = CardProfileServices();
    TeamGameModel team = TeamGameModel();
    try {
      team = await cardProfileService.getInfoProfileUser(token);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
    }
    return team;
  }
  @action
  Future<void>initProfile(TokenManager tokenManager) async {
    teamGameModel = await infoProfileUser(tokenManager);
  }
}