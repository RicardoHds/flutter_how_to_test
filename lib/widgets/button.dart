import 'package:DevSecOps/constants/colors.dart';
import 'package:DevSecOps/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isRounded;
  final bool disabled;
  final Color color;
  final Color textColor;
  final bool hasIcon;
  final IconData icon;
  final Function onPress;
  final EdgeInsets padding;
  final bool isOutlineButton;

  Button({
    Key key,
    @required this.text,
    this.disabled = false,
    this.onPress,
    this.color,
    this.textColor,
    this.isRounded = true,
    this.hasIcon = false,
    this.icon,
    this.padding = EdgeInsets.zero,
    this.isOutlineButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 40.0,
        child: RaisedButton(
          onPressed: disabled ? null : onPress,
          shape: isRounded
              ? RoundedRectangleBorder(
                  side: BorderSide(
                      color: isOutlineButton
                          ? COLORS.TURQUOISE
                          : COLORS.TRANSPARENT,
                      width: isOutlineButton ? 1 : 0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30.0))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
          disabledColor: COLORS.GRAY,
          disabledTextColor: COLORS.WHITE,
          color: color ?? (isOutlineButton ? COLORS.WHITE : COLORS.TURQUOISE),
          textColor: textColor ?? COLORS.WHITE,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hasIcon
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(icon),
                      )
                    : Container(),
                Text(
                  text,
                  style: isOutlineButton ? TextTurquiseBold : TextWhiteBold,
                )
              ]),
        ),
      ),
    );
  }
}
