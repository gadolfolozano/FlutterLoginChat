
import 'package:flutter_login_chat/redux/action/Action.dart';
import 'package:flutter_login_chat/redux/reducer/UserReducer.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';

AppState appReducer(AppState state, Action action){
  return AppState( userState: UserReducer.reduce(state.userState, action));
}