import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../shared/api/routes_api.dart';
import '../../../../shared/auth/token_model.dart';

class LoginServices{
  final headersApi = DefaultHeadersApi();
  Future<String> postLoginApi(LoginModel body) async {
    final url = Uri.parse(RoutersApi.login);
    final response = await http.post(
      url,
      body: jsonEncode(body.toJson()),
      headers: headersApi.headers,
    );
    final json = jsonDecode(response.body);
    return json['token'];
  } 

  Future<int> checkIdUser(String token) async {
    final url = Uri.parse(RoutersApi.me);
    final body = TokenModel(token:token);
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headersApi.headers,
    );

    final json = jsonDecode(response.body);
    return json['id'];
  }
  
  Future<TeamGameModel> getCheckTeamVirtual(String token, String idUser) async {
    final url = Uri.parse('${RoutersApi.checkIdUser}$idUser');
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);

    final json = jsonDecode(response.body);
    return TeamGameModel.fromJson(json[0]);
  }

}