import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_chat/ui/dashboard/DashboardScreen.dart';
import 'package:flutter_login_chat/ui/login/LoginScreen.dart';

class SplashScreen extends StatelessWidget {

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
      home: Builder(builder: (context) => _SplashContent()),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => DashboardScreen(),
        '/login': (BuildContext context) => LoginScreen(),
      },
    );
  }
}

class _SplashContent extends StatefulWidget {
  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<_SplashContent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkUserLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2b2f3d),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _checkUserLogin(BuildContext contextx) {
    _auth.currentUser().then((FirebaseUser user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }
}
