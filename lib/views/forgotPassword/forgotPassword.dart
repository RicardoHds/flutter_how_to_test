import 'package:DevSecOps/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext _context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(color: COLORS.WHITE),
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Forgot Password',
                  key: Key('forgotPasswordHeader'),
                )
              ],
            )),
      ),
    );
  }
}
