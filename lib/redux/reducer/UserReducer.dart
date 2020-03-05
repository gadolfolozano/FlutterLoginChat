import 'package:flutter_login_chat/redux/action/Action.dart';
import 'package:flutter_login_chat/redux/state/UserState.dart';

class UserReducer{
  static UserState reduce(UserState state, action){
    switch(action.runtimeType){
      case DummyAction: return UserState(isLoading: false, loginError: false, userName: 'new user name');
    }
    return state;
  }
}