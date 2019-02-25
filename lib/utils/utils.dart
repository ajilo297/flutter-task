export 'api_manager.dart';
export 'database_manager.dart';

import "package:flutter/material.dart";

/// Utils
///
/// All utility functions should be placed in this class
class Utils {

  /// Displays a [SnackBar] to display [message] or [content] in it. It will
  /// return a [ScaffoldFeatureController]
  static ScaffoldFeatureController showSnackBar({
    @required GlobalKey<ScaffoldState> scaffoldKey,
    String message,
    Widget content,
  }) {
    assert(scaffoldKey != null);
    assert(message != null || content != null);
    assert(!(message != null && content != null));

    assert(scaffoldKey.currentState != null);

    Widget snackBarContent = content ?? Text("$message");
    scaffoldKey.currentState.removeCurrentSnackBar();
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: snackBarContent,
      ),
    );
  }
}