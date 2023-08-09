import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';
import '../models/player_edition_model.dart';
import '../services/buy_services.dart';

part 'buy_controller.g.dart';

class BuyController = BuyControllerImpl with _$BuyController;

abstract class BuyControllerImpl with Store{
  @observable
  String stateController = StateResponse.start;

  @observable
  TokenManager tokenManager = TokenManager();

  @observable
  BuyServices buyServices = BuyServices();

  @observable
  List<PlayerEditionModel> listBuy = [];

  @observable
  List<String> image = [ImagesApp.jogador1, ImagesApp.jogador2, ImagesApp.jogador3];

  @observable
  int previousNumber = 0;

  @action
  int generateNumber() {
    final random = Random();
    int number;
    do {
      number = random.nextInt(3);
    } while (number == previousNumber);
    previousNumber = number;
    return number;
  }

  @action
  void setList(value) => listBuy = value;
  
  @action
  Future<List<PlayerEditionModel>> playersForPosition(String position) async {
    List<PlayerEditionModel> list = [];
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    if(token != null){
      try{
        list = await buyServices.getPlayersPositionApi(token, position);
        //print(list[0].player!.firstname);
        stateController = StateResponse.sucess;
      } catch(e){
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }
    return list;
  }

  @action
  Future<void> initBuy(String position) async {
    List<PlayerEditionModel> list = [];
    list = await playersForPosition(position);
    //list = await allPlayers();
    setList(list);
  }
}