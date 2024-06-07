import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:network_exception_handler/exception_handler.dart';

class NetworkHandler {
  //! Crete an instance of network handler for easy access
  static NetworkHandler networkHandler = NetworkHandler();

  //! Set Time out
  static const int timeOutDuration = 35;

  //! Simply add Base url and End point
  String baseUrl = 'https://jsonplaceholder.typicode.com'; //mock api
  String endPoint = '/todos/1';

  //! Create a method of Get or Post Request
  Future<dynamic> getMethod() async {
    try {
      var url = Uri.parse(baseUrl + endPoint);
      var response = await http.get(url).timeout(const Duration(seconds: timeOutDuration));
      print(_processResponse(response));
      return _processResponse(response);
    } catch (e) {
      var errorMessage = ExceptionHandlers().getExceptionString(e);
      if (kDebugMode) {
        print('Error: $errorMessage');
      }
    }
  }

  dynamic _processResponse(http.Response response) {
    print('${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //!Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //!Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //!Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //!Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //!Internal Server Error
      default:
        throw FetchDataException('Something went wrong! ${response.statusCode}');
    }
  }
}
