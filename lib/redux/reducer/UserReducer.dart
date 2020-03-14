import 'package:flutter_login_chat/redux/action/Action.dart';
import 'package:flutter_login_chat/redux/action/SplashActions.dart';
import 'package:flutter_login_chat/redux/state/UserState.dart';

class UserReducer {
  static UserState reduce(UserState state, action) {
    switch (action.runtimeType) {
      case DummyAction:
        return state.copyWith(userName: 'new user name');
      case CheckUserLoggedLoadingAction:
        return state.copyWith(userName: 'loading user');
    }
    return state;
  }
}
