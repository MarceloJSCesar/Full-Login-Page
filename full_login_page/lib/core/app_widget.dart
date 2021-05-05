import 'package:flutter/material.dart';
import '../core/views/login/login_view.dart';
import './controllers/login/login_switch_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
        theme:
            ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginView(),
        },
      ),
    );
  }
}
