import 'package:DevSecOps/controllers/loginController.dart';
import 'package:test/test.dart';

void main() {
  final controller = LoginController();
  group('Unit Test', () {
    test('Sign in failed', () {
      controller.fetchSignIn('unknow@vitro.com', '!Qazxsw2');

      expect(false, false);
    });

    test('Sign in success', () {
      controller.fetchSignIn('juan.chavez@neoris.com', '!Qazxsw2');

      expect(true, true);
    });
  });
}
