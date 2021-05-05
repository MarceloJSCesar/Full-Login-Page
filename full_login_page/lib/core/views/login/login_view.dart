import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../views/home/home_view.dart';
import '../../services/login/login_service.dart';
import '../../interfaces/login/login_interface.dart';
import '../../components/login/login_switch_button.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ILogin _loginService = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          LoginSwitchButton(),
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'E-mail'),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                textInputAction: TextInputAction.done,
                onEditingComplete: () async {
                  UserModel user = await _loginService.login(
                      _emailController.text, _passwordController.text);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomeView(user: user)));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
