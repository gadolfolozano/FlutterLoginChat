import 'package:flutter/material.dart';
import '../util/ValidatorUtil.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
    return Container(
      color: const Color(0xff2b2f3d),
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
                onFieldSubmitted: (term) =>
                    FocusScope.of(context).requestFocus(passwordFocusNode),
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
              width: double.infinity,
              margin: const EdgeInsets.only(left: 24, right: 24),
              child: RaisedButton(
                onPressed:
                    _loginButtonEnabled ? () => performLogin(context) : null,
                child: Text('Login', style: TextStyle(fontSize: 20)),
                padding: const EdgeInsets.only(top: 12, bottom: 12),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: FlatButton(
                  onPressed: () {},
                  child: Text('Register', style: TextStyle(fontSize: 16))),
            ),
            Container(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }

  String validateEmail(String email) {
    if (!ValidatorUtil.isEmailValid(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String password) {
    if (!ValidatorUtil.isPasswordValid(password)) {
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
      _loginButtonEnabled =
          ValidatorUtil.isEmailValid(usernameController.text) &&
              ValidatorUtil.isPasswordValid(passwordController.text);
    });
  }
}
