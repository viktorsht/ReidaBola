import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/token_model.dart';
import '../../shared/user/models/user_model.dart';

class StartServices{

  final headersApi = DefaultHeadersApi();

  Future<UserModel> postMeProfile(String token) async {
    final url = Uri.parse(RoutersApi.me);
    final body = TokenModel(token:token);
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headersApi.headers,
    );

    final json = jsonDecode(response.body);
    return UserModel.fromJson(json);
  } 

  Future<TeamGameModel> getInfoProfileUser(String token) async {
    final url = Uri.parse(RoutersApi.teamGame);
    final body = TokenModel(token:token);
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headersApi.headers,
    );
    final json = jsonDecode(response.body);
    return TeamGameModel.fromJson(json);
  }


}