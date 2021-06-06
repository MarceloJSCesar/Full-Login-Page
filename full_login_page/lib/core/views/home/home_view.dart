import 'package:flutter/material.dart';
import 'package:full_login_page/core/services/login/login_service.dart';
import '../../models/user_model.dart';

class HomeView extends StatefulWidget {
  final UserModel user;
  HomeView({@required this.user});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.user.email),
            Text(widget.user.token),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Text('Logout'),
              label: Icon(Icons.logout),
              onPressed: () async {
                final logoutValue = await LoginService().logout();
                if (logoutValue == true) {
                  Navigator.of(context).pushReplacementNamed('/login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        'error with your token, have to login again',
                      ),
                    ),
                  );
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
