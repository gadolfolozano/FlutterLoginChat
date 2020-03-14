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

  UserState copyWith({
    bool isLoading,
    bool loginError,
    String userName,
  }) {
    return new UserState(
        isLoading: isLoading ?? this.isLoading,
        loginError: loginError ?? this.loginError,
        userName: userName ?? this.userName);
  }

  factory UserState.initial() {
    return new UserState(
        isLoading: false, loginError: false, userName: 'userName');
  }
}
