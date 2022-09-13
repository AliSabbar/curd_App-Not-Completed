import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../components/constants.dart';

class ApiHelper {
  static String baseUrl = "https://student.valuxapps.com/api/";

  static Future getData({required String url}) async {
    http.Response response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Content-Type": "application/json",
      "lang": 'en',
      "Authorization": TOKEN,
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("There are Error in Status Code ${response.statusCode}");
    }
  }

  static Future postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {
        "Content-Type": "application/json",
        "lang": 'en',
        "Authorization": TOKEN,
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("There are Error in Status Code ${response.statusCode}");
    }
  }
}
