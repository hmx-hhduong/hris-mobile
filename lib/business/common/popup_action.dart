import 'package:async_redux/async_redux.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/popup_state.dart';

class PopupAction extends ReduxAction<AppState> {
  final String title;
  final String message;
  final String buttonTitle1;
  final String buttonTitle2;

  PopupAction({this.title, this.message, this.buttonTitle1, this.buttonTitle2});

  @override
  AppState reduce() {
    return state.copyWith(
        popupState: PopupState(
            title: title,
            message: message,
            titleButton1: buttonTitle1,
            titleButton2: buttonTitle2));
  }
}
