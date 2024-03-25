import 'package:http/http.dart' as http;

Future<http.Response> get(String url) async {
  final headers = _headers();
  var response = await http.get(Uri.parse(url), headers: headers);
  return response;
}

Map<String, String> _headers() {
  return {
    'Content-Type': 'application/json',
  };
}
