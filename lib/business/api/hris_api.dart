import 'dart:convert';

import 'package:hris_mobile/business/models/signin_response.dart';
import 'package:http/http.dart' as http;

class HrisAPI {
  final baseUrl = 'http://192.168.100.39:2627/';

  Future<SigninResponse> signIn(
      String username, String password, bool rememberMe) async {
    print("LOG signIn: $username $password $rememberMe");
    final response =
        await http.post('http://192.168.100.39:2627/v1/Account/signin',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'userName': username,
              'password': password,
              'rememberMe': rememberMe,
              'companyID': "3fa85f64-5717-4562-b3fc-2c963f66afa6"
            }));

    if (response.statusCode == 200) {
      print("LOG post signin success: ${response.toString()}");
      return SigninResponse.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 403){
      print("LOG post signin error: ${response.body}");
      throw Exception('User name or password is invalid');
    } else{
      throw Exception('Login fail');
    }
  }


}
