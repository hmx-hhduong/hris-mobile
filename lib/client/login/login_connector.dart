
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/client/login/login_viewmodel.dart';

class LoginConnector extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _LoginState();

}

class _LoginState extends State<LoginConnector>{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (BuildContext context, LoginViewModel viewModel) => LoginContent(viewModel),
    );
  }

}
class LoginContent extends StatelessWidget{
  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  LoginContent(this.vm);


}