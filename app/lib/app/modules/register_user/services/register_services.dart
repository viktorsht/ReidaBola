import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/shared/models/error.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_model.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_sucess_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../shared/api/routes_api.dart';

class RegisterServices{

  final headersApi = DefaultHeadersApi();
  Future<RegisterUserSucessModel> postRegisterUserApi(RegisterUserModel body) async {
    final url = Uri.parse(RoutersApi.register);
    final response = await http.post(
      url,
      headers: headersApi.headers,
      body: jsonEncode(body.toJson()),
    );

    if(response.statusCode == 201){
      final json = jsonDecode(response.body);
      final userJson = json['user'];
      return RegisterUserSucessModel.fromJson(userJson);
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