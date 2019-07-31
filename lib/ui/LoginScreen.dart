import 'package:flutter/material.dart';
import 'LoginForm.dart';

class LoginScreen extends StatelessWidget {
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
        body: LoginForm(),
      ),
    );
  }
}
