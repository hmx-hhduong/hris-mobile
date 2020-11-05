import 'package:async_redux/async_redux.dart';
import 'package:hris_mobile/business/common/popup_action.dart';

import 'app/app_state.dart';

Store<AppState> createStore() {
  return Store(
      initialState: AppState.initial(),
      errorObserver: AppErrorObserver<AppState>());
}

class AppErrorObserver<St> implements ErrorObserver<St> {
  @override
  bool observe(Object error, StackTrace stackTrace, ReduxAction<St> action, Store store) {
    print("Error thrown during $action: $error");
    // You can dispatch some action from here: store.dispatch(.....);
    store.dispatch(PopupAction(title: 'Error', message: 'No internet connection', buttonTitle1: 'Colse') );
    return false;
  }
}
