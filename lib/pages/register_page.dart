import 'package:flutter/material.dart';

import 'package:flutter_app/utils/utils.dart';
import 'package:flutter_app/models/models.dart';

class RegisterPage extends StatefulWidget {
  final String title;

  RegisterPage({this.title});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  DateTime dateOfBirth;

  String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? 'Register';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _register)
        ],
      ),
      body: ListView(
        children: <Widget>[
          _nameField(),
          _userNameField(),
          _passwordField(),
          _emailAddressField(),
          _locationField(),
          _shippingAddressField(),
          _mobileField(),
          _dateOfBirthField(),
          _privacyPolicyField(),
        ],
      ),
    );
  }

  Widget _nameField() {
    return _formattedTextField(
      hint: "Name",
      controller: nameController,
    );
  }

  Widget _userNameField() {
    return _formattedTextField(
      hint: "User name",
      controller: usernameController,
    );
  }

  Widget _passwordField() {
    return _formattedTextField(
      hint: "Password",
      controller: passwordController,
      isPassword: true,
    );
  }

  Widget _emailAddressField() {
    return _formattedTextField(
        hint: "Email Address",
        controller: emailAddressController,
        keyboardType: TextInputType.emailAddress);
  }

  Widget _locationField() {
    return _formattedTextField(
      hint: "Location",
      controller: locationController,
    );
  }

  Widget _shippingAddressField() {
    return _formattedTextField(
      hint: "ShippingAddress",
      controller: shippingAddressController,
    );
  }

  Widget _mobileField() {
    return _formattedTextField(
        hint: "Mobile number",
        controller: mobileController,
        keyboardType: TextInputType.phone);
  }

  Widget _dateOfBirthField() {
    DateTime dob = dateOfBirth ?? DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text("${_formattedDateTime(dateTime: dob)}")),
          IconButton(icon: Icon(Icons.calendar_today), onPressed: _selectDate),
        ],
      ),
    );
  }

  String _formattedDateTime({@required DateTime dateTime}) {
    assert(dateTime != null);
    String dateString = '';
    dateString += '${dateTime.day}/';
    dateString += '${dateTime.month}/';
    dateString += '${dateTime.year}';
    return dateString;
  }

  Widget _privacyPolicyField() {
    return Container();
  }

  Widget _formattedTextField({
    @required String hint,
    TextEditingController controller,
    bool isPassword = false,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    VoidCallback onTap,
  }) {
    assert(hint != null);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(labelText: hint),
        controller: controller,
        obscureText: isPassword,
        enabled: enabled,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onTap: onTap,
      ),
    );
  }

  void _selectDate() {
    print('Called on tap');
    showDatePicker(
      context: context,
      initialDate: DateTime(2010, 1, 1),
      firstDate: DateTime(1940),
      lastDate: DateTime(2010, 12, 31),
    ).then((selectedDate) => setState(() => dateOfBirth = selectedDate));
  }

  void _register() {
    String nameString = nameController.text;
    String userNameString = usernameController.text;
    String passwordString = passwordController.text;
    String emailString = emailAddressController.text;
    String locationString = locationController.text;
    String shippingString = shippingAddressController.text;
    String mobileString = mobileController.text;
    String dateOfBirthString = _formattedDateTime(dateTime: dateOfBirth);

    UserModel userModel = UserModel(
      name: nameString,
      password: passwordString,
      username: userNameString,
      shippingAddress: shippingString,
      mobileNumber: mobileString,
      location: locationString,
      emailAddress: emailString,
      dateOfBirth: dateOfBirthString,
      privacyPolicy: true,
    );

    DatabaseManager.register(model: userModel);
  }
}