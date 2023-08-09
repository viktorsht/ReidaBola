
import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import '../models/player_edition_model.dart';

part 'buy_store.g.dart';

class BuyStore = BuyStoreImpl with _$BuyStore;

abstract class BuyStoreImpl with Store{

  @observable
  List<PlayerEditionModel> teamList = [];

  @observable
  String stateStoreBuy = StateResponse.start;
  
  @action
  void setTeamList(PlayerEditionModel player) {
    stateStoreBuy = StateResponse.loading;
    teamList.add(player);
    //await Future.delayed(const Duration(seconds: 2));
    stateStoreBuy = StateResponse.sucess;
    //print('Jogador Adicionado = ${player.playerEdition!.player!.firstname}');
  }

  @action
  List<PlayerEditionModel> getListPlayer() => teamList;

  @observable
  int goleiro = 0;

  @observable
  int zagueiro = 0;

  @observable
  int lateral = 0;

  @observable
  int meia = 0;

  @observable
  int volante = 0;

  @observable
  int atacante = 0;

  @computed
  bool get isGolAdd => goleiro == 1; 

  @computed
  bool get isZagAdd => zagueiro == 2;

  @computed
  bool get isLatAdd => lateral == 2;

  @computed
  bool get isMeiAdd => meia == 2;

  @computed
  bool get isVolAdd => volante == 1;
  
  @computed
  bool get isAtaAdd => atacante == 3;
  
  @computed
  bool get isButtonValid => isGolAdd && isLatAdd && isZagAdd && isMeiAdd && isVolAdd && isAtaAdd;

  @action
  void clearState() => stateStoreBuy = StateResponse.start;

  @action
  void addPlayerToVirtualTeam(PlayerEditionModel player){
    String position = player.playerEdition!.player!.position!.abb!;
    //print('Jogador = ${player.playerEdition!.player!.firstname}');
    if(position == 'GOL' && !isGolAdd){
      setTeamList(player);
      goleiro++;
    }
    if(position == 'ZAG' && !isZagAdd){
      setTeamList(player);
      zagueiro++;
    }
    if(position == 'LAT' && !isLatAdd){
      setTeamList(player);
      lateral++;
    }
    if(position == 'MEI' && !isMeiAdd){
      setTeamList(player);
      meia++;
    }
    if(position == 'VOL' && !isVolAdd){
      setTeamList(player);
      volante++;
    }
    if(position == 'ATA' && !isAtaAdd){
      setTeamList(player);
      atacante++;
    }
  }
  
}