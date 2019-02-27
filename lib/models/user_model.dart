import 'package:meta/meta.dart';

class UserModel {
  final String username;
  final String password;
  final String name;
  final String emailAddress;
  final String location;
  final String shippingAddress;
  final String mobileNumber;
  final String dateOfBirth;
  final bool privacyPolicy;

  UserModel({
    @required this.username,
    @required this.password,
    this.name,
    this.emailAddress,
    this.location,
    this.shippingAddress,
    this.mobileNumber,
    this.dateOfBirth,
    this.privacyPolicy,
  });
}
