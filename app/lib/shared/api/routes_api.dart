import 'package:rei_da_bola/shared/api/api.dart';

class RoutersApi{
  
  static String login = '${Api.urlApi}login';
  static String register = '${Api.urlApi}register';
  static String refesh = '${Api.urlApi}refesh';
  static String me = '${Api.urlApi}me';
  static String soccerMatch = '${Api.urlApi}soccerMatch';
  static String teamGame = '${Api.urlApi}teamGame';
  static String playerEdition = '${Api.urlApi}playerEdition';
  static String championshipEdition = '${Api.urlApi}championshipEdition';
  static String teamGameEdition = '${Api.urlApi}teamGameEdition';
  static String championshipRound = '${Api.urlApi}championshipRound';
  static String checkIdUser = '${Api.urlApi}teamGame?filter=user_id:=:';
  static String roundToday = '${Api.urlApi}soccerMatch/next?date=';
  static String positionAbb = '${Api.urlApi}matchLineup?filter=playerEdition|player|position.abb:=:';
  static String positionName = '${Api.urlApi}matchLineup?filter=playerEdition|player|position.name:=:';
  static String matchGameLineup = '${Api.urlApi}matchGameLineup';

}