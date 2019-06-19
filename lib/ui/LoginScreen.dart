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
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Email adress:',
                      prefixIcon: Icon(
                        Icons.mail_outline,
                      )),
                  textInputAction: TextInputAction.next,
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
                  onPressed: () {},
                  child: const Text('Login', style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
