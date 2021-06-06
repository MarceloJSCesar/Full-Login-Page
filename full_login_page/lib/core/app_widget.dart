import 'package:flutter/material.dart';
import 'package:full_login_page/core/services/login/login_service.dart';
import 'package:full_login_page/core/views/home/home_view.dart';
import '../core/views/login/login_view.dart';
import './controllers/login/login_switch_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginService().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return LoginView();
              default:
                if (snapshot != null) {
                  return HomeView(user: snapshot.data);
                } else {
                  return LoginView();
                }
            }
          },
        ),
        theme:
            ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
        routes: {
          '/login': (_) => LoginView(),
        },
      ),
    );
  }
}
