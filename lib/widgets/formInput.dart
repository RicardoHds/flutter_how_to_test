import 'package:DevSecOps/constants/colors.dart';
import 'package:DevSecOps/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormInput extends StatefulWidget {
  FormInput({
    Key key,
    @required this.controller,
    @required this.text,
    @required this.validation,
    this.customValidator,
    this.autoFocus = false,
    this.isPassword = false,
    this.icon,
    this.onChange,
    this.readOnly = false,
    this.autoValidate = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final MultiValidator validation;
  final Function customValidator;
  final bool autoFocus;
  final bool isPassword;
  final bool autoValidate;
  final IconData icon;
  final Function onChange;
  final bool readOnly;

  @override
  _FormInput createState() => _FormInput();
}

class _FormInput extends State<FormInput> {
  bool _hidePassword = true;

  void _handleTapPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: COLORS.BLUE,
        ),
        child: TextFormField(
          autovalidate: widget.autoValidate,
          enabled: !widget.readOnly,
          readOnly: widget.readOnly,
          style: TextInput,
          onChanged: (value) =>
              {widget.onChange != null ? widget.onChange(value) : null},
          controller: widget.controller,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: COLORS.WHITE),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      _handleTapPassword();
                    },
                    icon: Icon(_hidePassword
                        ? Icons.panorama_fish_eye
                        : Icons.pan_tool),
                    iconSize: 18.0,
                    color: _hidePassword ? COLORS.GRAY : COLORS.BLUE,
                  )
                : null,
            prefixIcon: widget.icon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(widget.icon, size: 16.0)])
                : null,
            labelText: widget.text,
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: COLORS.WHITE)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: COLORS.WHITE)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: COLORS.WHITE)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: COLORS.RED)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: COLORS.RED)),
          ),
          autofocus: widget.autoFocus,
          obscureText: widget.isPassword ? _hidePassword : widget.isPassword,
          validator: (value) => widget.validation != null
              ? widget.validation(value)
              : widget.customValidator != null
                  ? widget.customValidator(value)
                  : null,
        ),
      ),
    );
  }
}
