import 'package:flutter/material.dart';

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
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email adress:',
                  ),
                ),
              ),
              Container(
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password:',
                  ),
                  obscureText: true,
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  control() {}
}
