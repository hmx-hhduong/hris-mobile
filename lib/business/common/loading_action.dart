import 'package:async_redux/async_redux.dart';
import 'package:hris_mobile/business/app/app_state.dart';

class LoadingAction extends ReduxAction<AppState> {
  final bool isLoading;

  LoadingAction(this.isLoading);

  @override
  AppState reduce() {
    return state.copyWith(isLoading: this.isLoading);
  }
}