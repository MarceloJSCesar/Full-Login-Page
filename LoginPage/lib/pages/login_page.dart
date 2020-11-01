import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: themeSwitch
                ? Icon(
                    Icons.wb_sunny,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.brightness_2,
                    color: Colors.blue,
                  ),
            onPressed: () {
              setState(() {
                themeSwitch = !themeSwitch;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.star_outline,
                color: themeSwitch ? Colors.black : Colors.blue,
                size: 80,
              ),
              Form(
                key: formKey,
                child: Container(
                  width: 540,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (emailController.text.length == 0) {
                              return 'fill the data';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: themeSwitch ? Colors.black : Colors.blue,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  formKey = GlobalKey<FormState>();
                                  emailController.text = "";
                                });
                              },
                              icon: Icon(
                                Icons.clear,
                                size: 16,
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: themeSwitch ? Colors.black : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (passwordController.text.length == 0) {
                              return 'fill the data';
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: themeSwitch ? Colors.black : Colors.blue,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  formKey = GlobalKey<FormState>();
                                  passwordController.text = "";
                                });
                              },
                              icon: Icon(
                                Icons.clear,
                                size: 18,
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: themeSwitch ? Colors.black : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 45,
                        width: 380,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
                          child: RaisedButton(
                            color: themeSwitch ? Colors.black : Colors.blue,
                            onPressed: () {
                              if (emailController.text.length > 0 &&
                                  passwordController.text.length > 0) {
                                setState(() {
                                  formKey = GlobalKey<FormState>();
                                });
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content: Text('Correct'),
                                      );
                                    });
                              } else {
                                formKey.currentState.validate();
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
