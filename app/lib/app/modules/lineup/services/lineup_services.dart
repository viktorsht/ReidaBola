import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/lineup/models/lu_player_lineup_model.dart';
import '../../../../shared/api/routes_api.dart';
import '../models/register_lineup_model.dart';

class LineUpServices{
  final router = RoutersApi();
  Future<List<PlayerLineUpModel>> getPlayersApiServices(String token, String position, String round, String edition) async {
    final url = Uri.parse(router.positionName(position, round, edition));
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => PlayerLineUpModel.fromJson(json)).toList();
  }

  Future<RegisterLineUpModel> postRegisterLineUp(String token, RegisterLineUpModel body) async {
    final url = Uri.parse(RoutersApi.matchGameLineupPost);
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body.toJson()),
    );
    final json = jsonDecode(response.body);
    return RegisterLineUpModel.fromJson(json);
  }
}