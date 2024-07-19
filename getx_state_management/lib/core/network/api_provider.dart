import 'dart:convert';
import 'package:getx_state_management/module/users_list/model/users_list_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final Uri _url = Uri.parse('https://jsonplaceholder.typicode.com/users');  

  Future<List<UsersListResponse>> fetchUsers() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);

        List<UsersListResponse> userResponse = decodedResponse.map((e) => UsersListResponse.fromJson(e)).toList();

        return userResponse;
      } else {
        print(jsonDecode(response.body)['message']);
        return [];
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }
  }
}
