import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:flutter_login_chat/ui/dashboard/DashboardScreen.dart';
import 'package:flutter_login_chat/ui/login/LoginScreen.dart';
import 'package:flutter_login_chat/ui/splash/SplashViewModel.dart';
import 'package:flutter_redux/flutter_redux.dart';

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

class _SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SplashViewModel>(
      converter: (store) => SplashViewModel.fromStore(store),
      onInit: (store) => print('onInit called'),
      builder: (_, viewModel) {
        return Column(
          children: <Widget>[
            Text(viewModel.username),
            RaisedButton(
              onPressed: () => viewModel.dummyFunction(),
              child: Text('Click me', style: TextStyle(fontSize: 20)),
              padding: const EdgeInsets.only(top: 12, bottom: 12),
            )
          ],
        );
      },
    );
  }
}

/*Container(
color: const Color(0xff2b2f3d),
child: Center(
child: Column(
children: <Widget>[
Text('Hola que hace'),
RaisedButton(
onPressed: () => print('hola'),
child: Text('Click me', style: TextStyle(fontSize: 20)),
padding: const EdgeInsets.only(top: 12, bottom: 12),
),
],
),
),
)*/

/*
class _SplashContent2 extends StatefulWidget {
  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<_SplashContent2> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    //_checkUserLogin(context);
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

 */
