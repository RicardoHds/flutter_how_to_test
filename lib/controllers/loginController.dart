import 'package:DevSecOps/services/loginService.dart';
import 'package:DevSecOps/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginController {
  LoginService loginService = LoginService();

  // final emailController = TextEditingController(text: 'juan.chavez@neoris.com');
  // final passwordController = TextEditingController(text: '!Qazxsw2');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(context) async {
    if (formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      if (await fetchSignIn(emailController.text, passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        Toast.error(context, 'Invalid credentials, please try again.');
      }
    }
  }

  Future<bool> fetchSignIn(String user, String password) async {
    Map<String, String> body = {
      "username": user,
      "password": password,
    };

    Response response = await loginService.signIn(body);

    bool success = false;

    if (response.statusCode == 200) {
      // String responseString = response.data["accessToken"];
      success = true;
    }

    return success;
  }
}
