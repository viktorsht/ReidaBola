import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/services/team_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';
import '../../../../../../shared/api/state_response.dart';
import '../models/match_game_line_up_model.dart';

part 'team_controller.g.dart';

class TeamController = TeamControllerImpl with _$TeamController;

abstract class TeamControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  List<MatchGameLineUpModel> matchGameLineUpList = [];
  
  @observable
  TeamServices teamService = TeamServices();

  @action
  Future<List<MatchGameLineUpModel>> checkTeamScale() async {
    stateController = StateResponse.loading;
    List<MatchGameLineUpModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await teamService.getTeamServices(token);
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
  Future<void> initTeamScale() async {
    matchGameLineUpList = await checkTeamScale();
  }
}