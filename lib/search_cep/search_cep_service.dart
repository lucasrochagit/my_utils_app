import 'dart:convert';

import 'package:my_utils_app/common/services/api_response.dart';
import 'package:my_utils_app/search_cep/search_cep.dart';
import 'package:my_utils_app/common/services/http_helper.dart' as http;

class SearchCEPService {
  static Future<ApiResponse<SearchCEP>> search(String code) async {
    String url = "http://apps.widenet.com.br/busca-cep/api/cep.json?code=$code";
    var response = await http.get(url);
    Map resBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return ApiResponse.ok(SearchCEP.fromJson(resBody));
    }
    return ApiResponse.error(resBody["message"]);
  }
}
