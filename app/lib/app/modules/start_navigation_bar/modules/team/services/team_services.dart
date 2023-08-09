import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../shared/api/routes_api.dart';
import '../models/match_game_line_up_model.dart';

class TeamServices{

  Future<List<MatchGameLineUpModel>> getTeamServices(String token) async {
    final url = Uri.parse('${RoutersApi.soccerMatch}?token=$token');
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
    return list.map((json) => MatchGameLineUpModel.fromJson(json)).toList();
  } 
  
}