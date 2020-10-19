import 'package:async_redux/async_redux.dart';

import 'app/app_state.dart';

Store<AppState> createStore(){
  return Store(initialState: AppState.initial());
}