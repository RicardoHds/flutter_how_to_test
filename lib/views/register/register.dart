import 'package:DevSecOps/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
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
                  'Register',
                  key: Key('registerHeader'),
                )
              ],
            )),
      ),
    );
  }
}
