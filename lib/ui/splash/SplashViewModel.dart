import 'package:flutter_login_chat/redux/action/Action.dart';
import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:redux/redux.dart';

class SplashViewModel {
  final Store<AppState> store;
  final String username;

  SplashViewModel({this.store, this.username});

  static SplashViewModel fromStore(Store<AppState> store) {
    SplashViewModel viewModel = SplashViewModel(
      store: store,
      username: store.state.userState.userName,
    );
    viewModel.checkUserLogin();
    return viewModel;
  }

  void checkUserLogin() {
    print('checkUserLogin called');
  }

  void dummyFunction() {
    print('dummyFunction called dispatching');
    store.dispatch(DummyAction());
  }
}
