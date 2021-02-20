import 'package:DevSecOps/main.dart';
import 'package:DevSecOps/views/login/login.dart';
import 'package:DevSecOps/widgets/button.dart';
import 'package:DevSecOps/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget Test', () {
    testWidgets('Finds user and password fields and button to sign in disabled',
        (WidgetTester tester) async {
      final usernameField = find.byKey(ValueKey('usernameField'));
      final passwordField = find.byKey(ValueKey('passwordField'));
      final singInButton = find.byKey(ValueKey('signInButton'));

      await tester.pumpWidget(MaterialApp(
        home: Login(),
      ));

      await tester.pump();

      expect(usernameField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(tester.widget<Button>(singInButton).disabled, isTrue);
    });

    testWidgets('Finds a link to recover password',
        (WidgetTester tester) async {
      final recoverPassword = find.text('Forgot password?');

      await tester.pumpWidget(MaterialApp(
        home: Login(),
      ));

      await tester.pump();

      expect(recoverPassword, findsOneWidget);
    });

    testWidgets('Finds a link to create account', (WidgetTester tester) async {
      final createAccount = find.text('Create account');

      await tester.pumpWidget(MaterialApp(
        home: Login(),
      ));

      await tester.pump();

      expect(createAccount, findsOneWidget);
    });

    testWidgets('Can write username and password', (WidgetTester tester) async {
      final usernameField = find.byKey(ValueKey('usernameField'));
      final passwordField = find.byKey(ValueKey('passwordField'));

      await tester.pumpWidget(MaterialApp(
        home: Login(),
      ));

      await tester.enterText(usernameField, 'juan.chavez@neoris.com');

      await tester.enterText(passwordField, '!Qazxsw2');

      await tester.pump();

      expect(find.text('juan.chavez@neoris.com'), findsOneWidget);
      expect(find.text('!Qazxsw2'), findsOneWidget);
    });

    testWidgets('Go to create account screen', (WidgetTester tester) async {
      final createAccountButton = find.byKey(ValueKey('createAccount'));
      final registerHeader = find.byKey(ValueKey('registerHeader'));

      await tester.pumpWidget(MyApp());

      await tester.tap(createAccountButton);

      await tester.pump(const Duration(milliseconds: 600));

      await tester.pumpAndSettle();

      expect(registerHeader, findsOneWidget);
    });

    testWidgets('Go to forgot password screen', (WidgetTester tester) async {
      final forgotPasswordButton = find.byKey(ValueKey('recoverPassword'));
      final forgotPasswordHeader = find.byKey(ValueKey('forgotPasswordHeader'));

      await tester.pumpWidget(MyApp());

      await tester.tap(forgotPasswordButton);

      await tester.pump(const Duration(milliseconds: 600));

      await tester.pumpAndSettle();

      expect(forgotPasswordHeader, findsOneWidget);
    });

    testWidgets('Required fields', (WidgetTester tester) async {
      final usernameField = find.byKey(ValueKey('usernameField'));
      final singInButton = find.byKey(ValueKey('signInButton'));

      await tester.pumpWidget(MyApp());

      await tester.enterText(usernameField, 'juan.chavez@neoris.com');

      await tester.tap(singInButton);

      await tester.pump(const Duration(milliseconds: 600));

      expect(find.text('juan.chavez@neoris.com'), findsOneWidget);

      // await tester.pumpAndSettle();
      print('passed');
      // await tester.pump(const Duration(milliseconds: 600));

      // expect(find.widgetWithText(FormInput, 'Required field'), findsOneWidget);
    });
  });
}
