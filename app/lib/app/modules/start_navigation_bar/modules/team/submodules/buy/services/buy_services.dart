import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../../../shared/api/routes_api.dart';
import '../models/buy_model.dart';
import '../models/player_edition_model.dart';


class BuyServices{
  
  final headersApi = DefaultHeadersApi();

  Future<List<BuyModel>> getPlayersApi(String token) async {
    final url = Uri.parse('${RoutersApi.playerEdition}?token=$token');
    final response = await http.get(
      url,
      headers: headersApi.headers,
    );
    final list = jsonDecode(response.body) as List;
    return list.map((json) => BuyModel.fromJson(json)).toList();
  }

  Future<List<PlayerEditionModel>> getPlayersPositionApi(String token, String position) async {
    final url = Uri.parse('${RoutersApi.positionName}$position');
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.get(url,headers: headers,);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => PlayerEditionModel.fromJson(json)).toList();
  }  

}