import 'package:flutter_login_chat/redux/action/Action.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:redux/redux.dart';

class SplashViewModel {
  final String username;
  final Function dummyFunction;

  SplashViewModel({this.username, this.dummyFunction});

  static SplashViewModel fromStore(Store<AppState> store) {
    return SplashViewModel(
        username: store.state.userState.userName,
        dummyFunction: () {
          print('dummyFunction called dispatching');
          store.dispatch(DummyAction());
        });
  }
}
