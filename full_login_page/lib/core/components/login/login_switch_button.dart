import 'package:flutter/material.dart';
import '../../controllers/login/login_switch_controller.dart';

class LoginSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: LoginSwitchController.instance.isDark,
      onChanged: (value) {
        LoginSwitchController.instance.changeTheme(value);
      },
    );
  }
}
