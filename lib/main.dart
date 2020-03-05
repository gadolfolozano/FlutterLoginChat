import 'package:flutter/material.dart';
import 'package:flutter_login_chat/redux/reducer/AppReducer.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:flutter_login_chat/ui/splash/Splash.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = Store<AppState>(
      appReducer,
      initialState: new AppState.initial(),
      middleware: [thunkMiddleware]
  );

  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: SplashScreen(),
    );
  }
}
