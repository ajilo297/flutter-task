import 'package:flutter/material.dart';
import 'package:flutter_app/utils/utils.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({this.title});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? "Login";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: _loginUIContainer(),
          ),
        ),
      ),
    );
  }

  Widget _loginUIContainer() {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _spacer,
          _textFieldWith(hint: "Username", controller: userNameController),
          _spacer,
          _textFieldWith(
            hint: "Password",
            controller: passwordController,
            isPassword: true,
          ),
          _spacer,
          _spacer,
          _buttonRow(),
        ],
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(child: Text("Clear"), onPressed: _clear),
        _spacer,
        RaisedButton(child: Text("Login"), onPressed: _login),
      ],
    );
  }

  Widget _textFieldWith({
    String hint,
    TextEditingController controller,
    bool isPassword = false,
  }) {
    assert(hint != null);
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: hint,
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget get _spacer => SizedBox(height: 8.0, width: 8.0);

  void _clear() {
    setState(() {
      userNameController.text = "";
      passwordController.text = "";
    });
  }

  void _login() {
    String username = userNameController.text;
    String password = passwordController.text;

    if (!_isUsernameValid(userName: username)) {
      Utils.showSnackBar(
        scaffoldKey: _scaffoldStateKey,
        message: "Enter a valid username",
      );
      return;
    }

    if (!_isPasswordValid(password: password)) {
      Utils.showSnackBar(
        scaffoldKey: _scaffoldStateKey,
        message: "Enter a valid password",
      );
      return;
    }

    DatabaseManager.login(username: username, password: password);
  }

  bool _isUsernameValid({@required String userName}) {
    assert(userName != null);
    if (userName.isEmpty) return false;
    return true;
  }

  bool _isPasswordValid({@required String password}) {
    assert(password != null);
    if (password.isEmpty) return false;
    if (password.length < 6) return false;
    return true;
  }
}
