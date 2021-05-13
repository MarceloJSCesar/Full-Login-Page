// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';
import '../../interfaces/login/login_interface.dart';

class LoginService extends ILogin {
  @override
  Future<UserModel> login(String email, String password) async {
    final api = Uri.parse('https://reqres.in/api/login');
    final data = {"email": email, "password": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return UserModel(email: email, token: body['token']);
    } else {
      return null;
    }
  }
}
