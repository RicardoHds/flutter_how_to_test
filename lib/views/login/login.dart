import 'package:DevSecOps/constants/colors.dart';
import 'package:DevSecOps/helpers/validators.dart';
import 'package:DevSecOps/controllers/loginController.dart';
import 'package:DevSecOps/widgets/button.dart';
import 'package:DevSecOps/widgets/formInput.dart';
import 'package:DevSecOps/widgets/link.dart';
import 'package:DevSecOps/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool isDisabled = true;

  enableButton(val) {
    setState(() {
      isDisabled = val != '' ? false : true;
    });
  }

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
                Expanded(
                  child: Provider(
                    create: (context) => LoginController(),
                    child: Consumer<LoginController>(
                      builder: (context, controller, child) => Form(
                        key: controller.formKey,
                        child: Center(
                          child: SizedBox(
                            width: 500,
                            height: 400,
                            child: Card(
                              color: COLORS.BLACK,
                              elevation: 10,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 40.0),
                                        child: Text(
                                          'N E O',
                                          style: TitleBlackBold,
                                        ),
                                      ),
                                      FormInput(
                                        key: Key('usernameField'),
                                        onChange: (val) {
                                          enableButton(val);
                                        },
                                        controller: controller.emailController,
                                        text: 'Username',
                                        validation:
                                            Validators().requiredValidator,
                                        // autoFocus: true,
                                      ),
                                      FormInput(
                                        key: Key('passwordField'),
                                        onChange: (val) {
                                          enableButton(val);
                                        },
                                        controller:
                                            controller.passwordController,
                                        text: 'Password',
                                        validation:
                                            Validators().requiredValidator,
                                        isPassword: true,
                                      ),
                                      Button(
                                        key: Key('signInButton'),
                                        text: 'Sign in',
                                        disabled: isDisabled,
                                        color: COLORS.TEXT,
                                        onPress: () {
                                          controller.login(context);
                                        },
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Link(
                                              key: Key('recoverPassword'),
                                              text: 'Forgot password?',
                                              padding:
                                                  EdgeInsets.only(top: 30.0),
                                              underline: true,
                                              color: COLORS.WHITE,
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    '/forgot-password');
                                              },
                                            ),
                                          ]),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Link(
                  key: Key('createAccount'),
                  text: 'Create account',
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  color: COLORS.BLACK,
                  weight: FontWeight.bold,
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            )),
      ),
    );
  }
}
