import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../shared/models/soccer_match_model.dart';

class MoreServices{

  final headersApi = DefaultHeadersApi();

  Future<List<SoccerMatchModel>> postMoreServices(String token) async {
    final url = Uri.parse('${RoutersApi.soccerMatch}?token=$token');
    final response = await http.get(
      url,
      headers: headersApi.headers,
    );

    final list = jsonDecode(response.body) as List;
    return list.map((json) => SoccerMatchModel.fromJson(json)).toList();
  } 
  
}