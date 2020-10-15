import 'package:flutter/material.dart';
import 'package:hris_mobile/business/login/models/login_state.dart';

class AppState {

  final LoginState loginState;

  AppState({this.loginState});

  factory AppState.initial(){
    return AppState(loginState: LoginState.initial());
  }

  AppState copyWith (LoginState loginState){
    return AppState(loginState: loginState ?? this.loginState);
  }
}