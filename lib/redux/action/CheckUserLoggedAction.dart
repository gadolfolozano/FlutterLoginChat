import 'package:flutter_login_chat/redux/state/AppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'SplashActions.dart';

ThunkAction<AppState> checkUserLoggedAction() {
  return (Store store) {
    store.dispatch(new CheckUserLoggedLoadingAction());
  };
}
