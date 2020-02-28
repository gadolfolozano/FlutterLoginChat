import 'package:flutter/material.dart';
import 'package:flutter_login_chat/redux/reducer/AppReducer.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:flutter_login_chat/ui/splash/Splash.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
      appReducer,
      initialState: new AppState.initial(),
      middleware: [thunkMiddleware]
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
