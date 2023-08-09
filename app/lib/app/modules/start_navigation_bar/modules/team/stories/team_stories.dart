import 'package:mobx/mobx.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../submodules/buy/models/player_edition_model.dart';

part 'team_stories.g.dart';

class TeamStoriesController = TeamStoriesControllerImpl with _$TeamStoriesController;

abstract class TeamStoriesControllerImpl with Store{

  @observable
  List<int> idPlayerList = [];

  @action 
  bool searchPlayer(List<PlayerEditionModel> list, String position){
    for (var element in list){
      if(position == element.playerEdition?.player?.position?.abb){
        if(!idPlayerList.contains(element.playerEdition!.playerId) ){
          return true;
        }
      }
    }
    return false;
  }

  @action
  String playerGol(List<PlayerEditionModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.goleiro;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String playerTec(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.tecnico;
  }

  @action
  String player1(List<PlayerEditionModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador1;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player2(List<PlayerEditionModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador2;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player3(List<PlayerEditionModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador3;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String? playerName(List<PlayerEditionModel> list, String position){
    if(list.isNotEmpty){
      print(idPlayerList);
      for (var element in list){
        if(position == element.playerEdition?.player?.position?.abb){
          if(!idPlayerList.contains(element.playerEdition!.playerId) ){
            idPlayerList.add(element.playerEdition!.playerId!);
            //print(idPlayerList);
            return element.playerEdition?.player?.firstname;
          }
        }
      }
    }
    return null;
  }
}