import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final isPassword;
  final hintText;
  const Field({
    Key key,
    this.hintText,
    this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? true : false,
      textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
