import 'package:flutter/material.dart';

bool themeSwitch = false;
dynamic themeColors() {
  if (themeSwitch) {
    return Colors.blue;
  } else {
    return Colors.black;
  }
}

///////////////////////////////////////////

GlobalKey<FormState> formKey = GlobalKey<FormState>();

///////////////////////////////////////////

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();
