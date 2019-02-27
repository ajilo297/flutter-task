import 'package:flutter/material.dart';

import 'package:flutter_app/pages/pages.dart';

class NavigatorManager {
  static void navigateToHomePage({@required BuildContext context}) {
    _navigate(context: context, page: HomePage());
  }

  static void navigateToRegisterPage({@required BuildContext context}) {
    _navigate(context: context, page: RegisterPage());
  }

  static void _navigate({@required BuildContext context, @required Widget page}) {
    assert(context!=null);
    assert(page!=null);
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}