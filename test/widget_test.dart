import 'package:flutter_app/pages/login_page.dart' as login;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit Tests', () {

    test('User name valid test', () {
      String username;
      bool isValid;

      username = "";
      isValid = login.LoginPageState().isUsernameValid(userName: username);
      expect(isValid, false);

      username = "a";
      isValid = login.LoginPageState().isUsernameValid(userName: username);
      expect(isValid, false);

      username = "a@1234asdasd";
      isValid = login.LoginPageState().isUsernameValid(userName: username);
      expect(isValid, false);

      username = "johnDoe57";
      isValid = login.LoginPageState().isUsernameValid(userName: username);
      expect(isValid, true);
    });

    test('Password valid test', (){
      String password;
      bool isValid;

      password = "";
      isValid = login.LoginPageState().isPasswordValid(password: password);
      expect(isValid, false);

      password = "af";
      isValid = login.LoginPageState().isPasswordValid(password: password);
      expect(isValid, false);

      password = "asdasdf";
      isValid = login.LoginPageState().isPasswordValid(password: password);
      expect(isValid, true);
    });

  });
}