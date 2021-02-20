import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login', () {
    final userFieldFinder = find.byValueKey('usernameField');
    final singInButtonFinder = find.byValueKey('signInButton');
    final expectValidation = find.text('Required field');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Password as required field', () async {
      await driver.tap(userFieldFinder);
      await driver.enterText('test@neoris.com');
      await driver.waitFor(find.text('test@neoris.com'),
          timeout: Duration(seconds: 20));
      await driver.tap(singInButtonFinder);
      await Future.delayed(Duration(seconds: 20));

      expect(await driver.getText(expectValidation), 'Required field');
    });
  });
}
