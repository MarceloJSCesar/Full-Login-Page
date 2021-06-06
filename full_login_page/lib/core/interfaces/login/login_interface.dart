import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../models/user_model.dart';

abstract class ILogin {
  Future<UserModel> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email: email, token: body['token']);
    } else {
      return null;
    }
  }

  Future<UserModel> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } else {
      return null;
    }
  }

  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return true;
  }
}
