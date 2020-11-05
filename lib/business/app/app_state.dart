import 'package:hris_mobile/business/common/popup_state.dart';
import 'package:hris_mobile/business/login/models/login_state.dart';

class AppState {
  final LoginState loginState;
  final bool isLoading;
  final PopupState popupState;

  AppState({this.loginState, this.isLoading, this.popupState});

  factory AppState.initial() {
    return AppState(
        loginState: LoginState.initial(),
        isLoading: false,
        popupState: PopupState.initial());
  }

  AppState copyWith(
      {LoginState loginState, bool isLoading, PopupState popupState}) {
    return AppState(
        loginState: loginState ?? this.loginState,
        isLoading: isLoading ?? this.isLoading,
        popupState: popupState ?? this.popupState);
  }
}
