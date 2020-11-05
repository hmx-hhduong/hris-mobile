import 'package:async_redux/async_redux.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/loading_status.dart';
import 'package:hris_mobile/business/login/actions/login_action.dart';
import 'package:hris_mobile/business/login/selector.dart';
import 'package:hris_mobile/business/models/popup_model.dart';
import 'package:hris_mobile/client/login/login_connector.dart';

class Factory extends VmFactory<AppState, LoginConnector> {
  @override
  LoginViewModel fromStore() => LoginViewModel(
        error: state.loginState.error,
        loadingStatus: state.loginState.loadingStatus,
        isWatting: state.isLoading,
        popupModel: PopupModel(
            title: state.popupState.title,
            message: state.popupState.message,
            titleButton1: state.popupState.titleButton1,
            titleButton2: state.popupState.titleButton2),
        onSubmit: (username, password, rememberMe) => dispatch(LoginAction(
            userName: username, passWord: password, rememberMe: rememberMe)),
      );
}

class LoginViewModel extends Vm {
  final String error;
  final LoadingStatus loadingStatus;
  final bool isWatting;
  final PopupModel popupModel;

  final Function(String, String, bool) onSubmit;

  LoginViewModel(
      {this.error,
      this.loadingStatus,
      this.onSubmit,
      this.isWatting,
      this.popupModel})
      : super(equals: [error, loadingStatus, isWatting, popupModel]);
}
