
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/loading_status.dart';

String userNameSelector(AppState state) => state.loginState.userName;

String passWordSelector(AppState state) => state.loginState.password;

String errorSelector(AppState state) => state.loginState.error;

LoadingStatus loadingStatusSelector(AppState state) => state.loginState.loadingStatus;

bool rememberMeSelector(AppState state) => state.loginState.rememberMe;