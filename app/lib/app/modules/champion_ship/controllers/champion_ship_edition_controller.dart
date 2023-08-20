import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/champion_ship/services/champion_ship_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../../../../shared/api/state_response.dart';
import '../models/champion_ship_models.dart';
import '../models/team_game_edition_model.dart';
import '../models/team_game_edition_sucess_model.dart';

part 'champion_ship_edition_controller.g.dart';

class ChampionShipEditionController = ChampionShipEditionControllerImpl with _$ChampionShipEditionController;

abstract class ChampionShipEditionControllerImpl with Store{
  
  @observable
  String stateController = StateResponse.start;

  @observable
  List<ChampionShipEditionModel> championShip = [];

  @action
  void setListChampionShip(value) => championShip = value;
  
  @action
  Future<List<ChampionShipEditionModel>> getListChampionShip() async {
    final championService = ChampionShipServices();
    List<ChampionShipEditionModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await championService.getChampionShipServices(token);
        //print(retorno[0].championship?.name);
      } catch (e) {
        stateController = StateResponse.error;
      }
    }
    
    return retorno;
  }

  @action
  Future<TeamGameEditionSucessModel> postTeamGameEdition(int teamGameId, int championshipEditionId) async {
    stateController = StateResponse.loading;
    final championService = ChampionShipServices();
    TeamGameEditionSucessModel retorno = TeamGameEditionSucessModel();
    final body = TeamGameEditionModel(
      teamGameId: teamGameId, 
      championshipEditionId: championshipEditionId
    );
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await championService.postTeamGameEdition(token, body);
        stateController = StateResponse.sucess;
        //setListChampionShip(retorno);
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
  Future<void> initListChampionShit() async {
    championShip = await getListChampionShip();
  }
}