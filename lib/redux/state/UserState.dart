import 'package:meta/meta.dart';

@immutable
class UserState {
  final bool isLoading;
  final bool loginError;
  final String userName;

  UserState({
    @required this.isLoading,
    @required this.loginError,
    @required this.userName,
  });

  factory UserState.initial() {
    return new UserState(isLoading: false, loginError: false, userName: null);
  }
}
