import 'dart:convert';
import 'dart:io';

import 'package:curd_app/services/network/remote/app_excption.dart';
import 'package:http/http.dart' as http;

import '../../../components/constants.dart';

class ApiHelper {
  static String baseUrl = "https://student.valuxapps.com/api/";

// GET DATA

  static Future getData({required String url}) async {
    http.Response response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Content-Type": "application/json",
      "lang": 'en',
      "Authorization": TOKEN,
    }).timeout(const Duration(seconds: 10),
        onTimeout: () => throw 'Check Your Internet');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("There are Error in Status Code ${response.statusCode}");
    }
  }

// POST DATA

  static Future postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse(baseUrl + url),
            headers: {
              "Content-Type": "application/json",
              "lang": 'en',
              "Authorization": TOKEN,
            },
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw 'Check Your Internet');

      return jsonResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e.toString());
    }
  }


// UPDATE DATA


static Future updateData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http
          .put(
            Uri.parse(baseUrl + url),
            headers: {
              "Content-Type": "application/json",
              "lang": 'en',
              "Authorization": TOKEN,
            },
            body: jsonEncode(body), 
          )
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw 'Check Your Internet');

      return jsonResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e.toString());
    }
  }

  static jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
