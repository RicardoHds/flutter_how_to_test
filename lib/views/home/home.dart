import 'package:DevSecOps/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
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
                  'Home',
                  key: Key('homeHeader'),
                )
              ],
            )),
      ),
    );
  }
}
