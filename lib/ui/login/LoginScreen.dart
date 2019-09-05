import 'package:flutter/material.dart';
import 'package:flutter_login_chat/ui/login/LoginForm.dart';
import 'package:flutter_login_chat/ui/login/RegisterForm.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _showRegister;

  @override
  void initState() {
    super.initState();

    _showRegister = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xff2b2f3d),
          accentColor: Colors.white,
          buttonColor: Color(0xff61c9bf),
          disabledColor: Colors.grey,
        ),
        home: WillPopScope(
          onWillPop: () async {
            if (_showRegister) {
              _returnToLoginForm();
              return false;
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: _showRegister
                  ? IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => _handleIconBack(),
                    )
                  : null,
              elevation: 0,
            ),
            body: _showRegister
                ? RegisterForm()
                : LoginForm(
                    onShowRegister: _handleShowRegister,
                  ),
          ),
        ));
  }

  void _handleShowRegister() {
    setState(() {
      _showRegister = true;
    });
  }

  void _handleIconBack() {
    _returnToLoginForm();
  }

  void _returnToLoginForm() {
    setState(() {
      _showRegister = false;
    });
  }
}
