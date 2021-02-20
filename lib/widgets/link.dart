import 'package:DevSecOps/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final TextStyle style;
  final EdgeInsets padding;
  final Function onTap;
  final Color color;
  final Color hoverColor;
  final FontWeight weight;
  final bool underline;

  Link({
    Key key,
    @required this.text,
    @required this.onTap,
    this.style,
    this.padding = EdgeInsets.zero,
    this.color = COLORS.TEXT,
    this.hoverColor = COLORS.BLUE,
    this.weight = FontWeight.normal,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: hoverColor,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: weight,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
