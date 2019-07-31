import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode passwordFocusNode;
  TextEditingController usernameController;
  TextEditingController passwordController;
  GlobalKey<FormState> _formKey;
  bool _loginButtonEnabled;

  @override
  void initState() {
    super.initState();

    passwordFocusNode = FocusNode();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    usernameController.addListener(_handleUsernameChange);
    passwordController.addListener(_handlePasswordChange);

    _loginButtonEnabled = false;
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: 'Email adress:',
                          prefixIcon: Icon(
                            Icons.mail_outline,
                          )),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (term) => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      controller: usernameController,
                      validator: (value) => validateEmail(value),
                    ),
                  ),
                  Container(
                    height: 12,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password:',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                          )),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      focusNode: passwordFocusNode,
                      onFieldSubmitted: (term) => performLogin(context),
                      controller: passwordController,
                      validator: (value) => validatePassword(value),
                    ),
                  ),
                  Container(
                    height: 32,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: RaisedButton(
                      onPressed: _loginButtonEnabled
                          ? () => performLogin(context)
                          : null,
                      child: Text('Login', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    height: 64,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 8;
  }

  String validateEmail(String email) {
    if (!_isEmailValid(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String password) {
    if (!_isPasswordValid(password)) {
      return 'Please enter password';
    }
    return null;
  }

  performLogin(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  _handleUsernameChange() {
    _checkUserInputs();
  }

  _handlePasswordChange() {
    _checkUserInputs();
  }

  _checkUserInputs() {
    setState(() {
      _loginButtonEnabled = _isEmailValid(usernameController.text) &&
          _isPasswordValid(passwordController.text);
    });
  }
}
