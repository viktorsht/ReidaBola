import 'package:mobx/mobx.dart';

part 'team_virtual_register_store.g.dart';

class TeamVirtualRegisterStore = TeamVirtualRegisterStoreImpl with _$TeamVirtualRegisterStore;

abstract class TeamVirtualRegisterStoreImpl with Store{

  @observable
  bool sucessRegister = false;

  @action
  void setSucessRegister() => sucessRegister = true;

  @observable
  String nameTeam = "";

  @action
  void setNameTeam(String value) => nameTeam = value;

  @observable
  String abbreviationTeam = "";

  @action
  void setAbbreviationTeam(String value) => abbreviationTeam = value;
  
  @action
  void clearValues(){
    nameTeam = '';
    abbreviationTeam = '';
  }

  @computed
  bool get isValidFields => nameTeam.isNotEmpty && abbreviationTeam.isNotEmpty;

  @computed
  bool get isNameTeamValid => nameTeam.length >= 4;

  @computed
  bool get isAbbreviationTeam => abbreviationTeam.length >= 3;

}