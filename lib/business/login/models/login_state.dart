import 'package:hris_mobile/business/common/loading_status.dart';

class LoginState {
  final LoadingStatus loadingStatus;
  final String userName;
  final String password;
  final String error;
  final bool rememberMe;

  LoginState({this.loadingStatus, this.userName, this.password, this.error, this.rememberMe});

  factory LoginState.initial (){
    return LoginState(
        loadingStatus: LoadingStatus.idle,
        userName: '',
        password: '',
        error: '',
        rememberMe: false
    );
  }

  LoginState copyWith({LoadingStatus loadingStatus, String userName, String password, String error, bool rememberMe}){
    return LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      error: error ?? this.error,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginState &&
              runtimeType == other.runtimeType &&
              loadingStatus == other.loadingStatus &&
              userName == other.userName &&
              password == other.password &&
              error == other.error &&
              rememberMe == other.rememberMe;

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      userName.hashCode ^
      password.hashCode ^
      error.hashCode ^
      rememberMe.hashCode;



}