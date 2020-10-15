
import 'package:async_redux/async_redux.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/loading_status.dart';
import 'package:hris_mobile/business/login/actions/login_action.dart';
import 'package:hris_mobile/business/login/selector.dart';

class LoginViewModel extends Vm{
  final String error;
  final LoadingStatus loadingStatus;

  final Function(String, String, bool) onSubmit;

  LoginViewModel({this.error, this.loadingStatus, this.onSubmit}) : super(equals: [error, loadingStatus]);

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
      error: errorSelector(store.state),
      loadingStatus: loadingStatusSelector(store.state),
      onSubmit: (username, password, rememberMe) {
        store.dispatch(LoginAction(userName: username, passWord: password, rememberMe: rememberMe));
      }
    );
  }
}