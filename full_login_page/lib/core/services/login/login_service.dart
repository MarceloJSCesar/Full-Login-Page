import 'package:dio/dio.dart';
import '../../models/user_model.dart';
import '../../interfaces/login/login_interface.dart';

class LoginService extends ILogin {
  @override
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
}
