import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/api/api_headers.dart';
import 'package:rei_da_bola/shared/api/routes_api.dart';
import 'package:rei_da_bola/shared/auth/token_model.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

class AuthController {
  final _tokenManager = TokenManager();
  final headersApi = DefaultHeadersApi();
  bool isAuthenticated = false;

  Future<bool> checkTokenValidity() async {
    _tokenManager.removeToken();
    String? storedToken = await _tokenManager.getToken();
    isAuthenticated = storedToken != null ? await verifyTokenValidity(storedToken) : false;
    return isAuthenticated;
  }

  Future<bool> verifyTokenValidity(String token) async {
    try {
      final url = Uri.parse(RoutersApi.me);
      final body = TokenModel(token: token);
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headersApi.headers,
      );
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      return false;
    }
  }
}
