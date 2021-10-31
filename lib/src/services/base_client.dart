import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class BaseClient {
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 20;

  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .get(uri)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("API request timeout", uri.toString());
    }
  }

  //POST
  Future<dynamic> post(
      String baseUrl, String api, dynamic payloadObject) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObject);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("API request timeout", uri.toString());
    }
  }

  //DELETE

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error Occured with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
