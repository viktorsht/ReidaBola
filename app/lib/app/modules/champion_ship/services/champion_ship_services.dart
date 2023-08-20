import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../shared/api/routes_api.dart';
import '../models/champion_ship_models.dart';
import '../models/team_game_edition_model.dart';
import '../models/team_game_edition_sucess_model.dart';

class ChampionShipServices{

  Future<List<ChampionShipEditionModel>> getChampionShipServices(String token) async {
    final url = Uri.parse('${RoutersApi.championshipEdition}?token=$token');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    final list = jsonDecode(response.body) as List;
    return list.map((json) => ChampionShipEditionModel.fromJson(json)).toList();
  } 
  
  Future<TeamGameEditionSucessModel> postTeamGameEdition(String token, TeamGameEditionModel body) async {
    final url = Uri.parse(RoutersApi.teamGameEdition);
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    final json = jsonDecode(response.body);
    return TeamGameEditionSucessModel.fromJson(json);
  }
}