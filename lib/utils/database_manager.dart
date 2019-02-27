import 'package:meta/meta.dart';
import 'package:flutter_app/models/models.dart';

class DatabaseManager {
  static Future<bool> login({
    @required String username,
    @required String password,
  }) async {
    // TODO: - Complete Implementation
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  static Future<bool> register({
    UserModel model
  }) async {
    // TODO: - Complete Implementation
    await Future.delayed(Duration(seconds: 2));
    return false;
  }
}
