import 'package:flutter/material.dart';
import 'LoginForm.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xffEb4568),
        accentColor: Colors.white,
        buttonColor: Color(0xff61c9bf),
        disabledColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: LoginForm(),
      ),
    );
  }
}
