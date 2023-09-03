import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract interface class IHttpClient {
  Future<dynamic> get(String url);
}

@Injectable(as: IHttpClient)
class HttpClient implements IHttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    return jsonDecode(response.body);
  }
}
