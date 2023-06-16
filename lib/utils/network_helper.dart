import 'dart:convert';

import 'package:http/http.dart' as http;


class NetworkHelper{
  final clientHttp = http.Client();

  Future<dynamic> get(String url) async {
    final response = await clientHttp.get(Uri.parse(url));
    final status =response.statusCode;
    if(status < 200 || status >= 400){
      throw Exception(response.body);
    }
    return jsonDecode(response.body);
  }

  // post, put, patch, delete
}