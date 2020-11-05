import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hris_mobile/business/api/hris_api.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/loading_action.dart';
import 'package:hris_mobile/business/common/loading_status.dart';
import 'package:hris_mobile/business/login/models/login_state.dart';
import 'package:hris_mobile/business/utils/utils.dart';

/*
The reducer has direct access to:

The store state (which is a getter of the Action class).
The action state itself (the class fields, passed to the action when it was instantiated and dispatched).
The dispatch method, so that other actions may be dispatched from the reducer.

 */
class LoginAction extends ReduxAction<AppState> {
  final String userName;
  final String passWord;
  final bool rememberMe;

  LoginAction({this.userName, this.passWord, this.rememberMe});

  /*
  Sometimes, while an async reducer is running, you want to prevent the user from touching the screen.
  Also, sometimes you want to check preconditions like the presence of an internet connection,
  and don't run the reducer if those preconditions are not met.

  To help you with these use cases, you may override methods ReduxAction.before() and
  ReduxAction.after(), which run respectively before and after the reducer.
  ReduxAction.before() and ReduxAction.after() can return FutureOr<Function>
   */

  @override
  Future<void> before() async {
    await checkInternetConnection();
    dispatch(LoadingAction(true));
  }

  @override
  Future<AppState> reduce() async {

    HrisAPI api = HrisAPI();
    final storage = new FlutterSecureStorage();
    print('Monica LoginAction reduce() ');
    try {
      var signResponse = await api.signIn(userName, passWord, rememberMe);
      await storage.write(key: 'token', value: signResponse.token);
      dispatch(NavigateAction.pushReplacementNamed("/home"));
      return state.copyWith(loginState: LoginState(loadingStatus: LoadingStatus.success));
    } catch (err) {
      return state.copyWith(loginState: LoginState(
          loadingStatus: LoadingStatus.error, error: err.toString()));
    }
  }

  @override
  void after() => dispatch(LoadingAction(false));
}
