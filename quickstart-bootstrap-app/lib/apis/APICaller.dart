import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bootstrap/apis/APICallType.dart';
import 'package:bootstrap/apis/APIRequestType.dart';

import './APIConstants.dart';

class APICaller {
  static Future<http.Response> callAPI({
    String username,
    String password,
    String apiType,
    APIRequestType apiRequestType,
    Map requestBody,
    APICallType apiCallType: APICallType.synchronous,
    Function responseProcessor,
  }) async {
    String apiURL =
        APIConstants.serverPath + APIConstants.baseAPIPath + apiType;

    var headers = {"Content-Type": "application/json"};
    if (username != null) {
      headers["authorization"] =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
    }

    var body = json.encode(requestBody);

    var response;

    switch (apiRequestType) {
      case APIRequestType.get:
        response = await http.get(
          apiURL,
          headers: headers,
        );
        break;
      case APIRequestType.post:
        response = await http.post(
          apiURL,
          headers: headers,
          body: body,
        );
        break;
    }

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}
