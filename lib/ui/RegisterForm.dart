import 'package:flutter/material.dart';
import '../util/ValidatorUtil.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  FocusNode passwordFocusNode;
  FocusNode rePasswordFocusNode;
  TextEditingController usernameController;
  TextEditingController passwordController;
  TextEditingController rePasswordController;
  GlobalKey<FormState> _formKey;
  bool _loginButtonEnabled;

  @override
  void initState() {
    super.initState();

    passwordFocusNode = FocusNode();
    rePasswordFocusNode = FocusNode();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    usernameController.addListener(_handleUsernameChange);
    passwordController.addListener(_handlePasswordChange);
    rePasswordController.addListener(_handleRePasswordChange);

    _loginButtonEnabled = false;
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    rePasswordFocusNode.dispose();
    usernameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
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
              margin: const EdgeInsets.only(top: 12, left: 24, right: 24),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password:',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    )),
                obscureText: true,
                textInputAction: TextInputAction.next,
                focusNode: passwordFocusNode,
                onFieldSubmitted: (term) =>
                    FocusScope.of(context).requestFocus(rePasswordFocusNode),
                controller: passwordController,
                validator: (value) => validatePassword(value),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, left: 24, right: 24),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Confirm Password:',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    )),
                obscureText: true,
                textInputAction: TextInputAction.done,
                focusNode: rePasswordFocusNode,
                onFieldSubmitted: (term) => performLogin(context),
                controller: rePasswordController,
                validator: (value) => validateRePassword(value),
              ),
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
                child: Text('Register', style: TextStyle(fontSize: 20)),
                padding: const EdgeInsets.only(top: 12, bottom: 12),
              ),
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

  String validateRePassword(String password) {
    if (password != passwordController.text) {
      return 'Password does not match';
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

  _handleRePasswordChange() {
    _checkUserInputs();
  }

  _checkUserInputs() {
    setState(() {
      _loginButtonEnabled =
          ValidatorUtil.isEmailValid(usernameController.text) &&
              ValidatorUtil.isPasswordValid(passwordController.text) &&
              ValidatorUtil.isPasswordValid(rePasswordController.text);
    });
  }
}
