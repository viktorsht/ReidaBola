import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../shared/api/api_headers.dart';
import '../../../../../shared/api/routes_api.dart';
import '../../models/soccer_match_model.dart';

class RoundTodayServices{

  final headersApi = DefaultHeadersApi();
  
  Future<SoccerMatchModel> getRoundToday(String token, String today) async {
    final url = Uri.parse('${RoutersApi.roundToday}$today');
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);

    final json = jsonDecode(response.body);
    return SoccerMatchModel.fromJson(json);
  }
}