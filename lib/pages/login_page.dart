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
          _loginButton(),
          _spacer,
          _registerButton(),
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

  Widget _loginButton() {
    return RaisedButton(
      color: Color.fromARGB(255, 150, 0, 0),
       shape: StadiumBorder(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style:TextStyle(color: Colors.white),
          ),
          width: double.infinity,
        ),
        onPressed: _login);
  }

  Widget _registerButton() {
    return FlatButton(
      onPressed: _register,
      child: Text(
        "New User? Register",
        style: TextStyle(fontSize: 14.0),
      ),
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

  void _register() {
    NavigatorManager.navigateToRegisterPage(context: context);
  }

  void _login() {
    String username = userNameController.text;
    String password = passwordController.text;

    if (!isUsernameValid(userName: username)) {
      Utils.showSnackBar(
        scaffoldKey: _scaffoldStateKey,
        message: "Enter a valid username",
      );
      return;
    }

    if (!isPasswordValid(password: password)) {
      Utils.showSnackBar(
        scaffoldKey: _scaffoldStateKey,
        message: "Enter a valid password",
      );
      return;
    }

    DatabaseManager.login(
      username: username,
      password: password,
    ).then((b) {
      if (b)
        _navigateToHomePage();
      else {
        Utils.showSnackBar(
          scaffoldKey: _scaffoldStateKey,
          message: "Invalid Credentials",
        );
      }
    });
  }

  void _navigateToHomePage() {
    NavigatorManager.navigateToHomePage(context: context);
  }

  @visibleForTesting
  bool isUsernameValid({@required String userName}) {
    assert(userName != null);
    if (userName.isEmpty) return false;
    if (userName.length < 6) return false;
    if (userName.contains(new RegExp(r'[@!#$%^&*()]'))) return false;
    return true;
  }

  @visibleForTesting
  bool isPasswordValid({@required String password}) {
    assert(password != null);
    if (password.isEmpty) return false;
    if (password.length < 6) return false;
    return true;
  }
}
