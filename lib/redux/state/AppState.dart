import 'package:flutter_login_chat/redux/state/UserState.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final UserState userState;

  AppState({@required this.userState});

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
    );
  }
}