import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../shared/api/routes_api.dart';
import '../../../../shared/models/error.dart';
import '../model/register_team_virtual_model.dart';
import '../model/register_team_virtual_sucess_model.dart';

class RegisterTeamVirtualServices{

  Future<RegisterTeamVirtualSucessModel> postRegisterTeamVirtualApi(RegisterTeamVirtualModel body, String token) async {
    final url = Uri.parse(RoutersApi.teamGame);
    final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
    final response = await http.post(
      url,
      body: jsonEncode(body.toJson()),
      headers: headers,
    );
    if(response.statusCode == 201){
      final json = jsonDecode(response.body);
      return RegisterTeamVirtualSucessModel.fromJson(json);
    }
    else if(response.statusCode == 422){
      final json = jsonDecode(response.body);
      final errors = json['errors'];
      throw ErrorRegisterExceptionModel(errors);
    }
    else{
      throw Exception('Falha ao cadastrar usuário');
    }
  } 
}