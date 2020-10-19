import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/client/login/login_viewmodel.dart';

class LoginConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (BuildContext context, LoginViewModel viewModel) =>
          LoginContent(viewModel),
    );
  }

}

class LoginContent extends StatelessWidget {
  final LoginViewModel vm;
  bool isChecked = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkBoxValue = false;

  updateRememberMe(value){
    isChecked = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Humax',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                  child: Text(vm.error ?? '', style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),),
                ),
                Container(
                    height: 50,
                    margin: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        vm.onSubmit(nameController.text, passwordController.text, true);
                      },
                    )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CheckBoxRememberMe(updateRememberMe: updateRememberMe),
                Text('Remember me')
              ],
            ),
          ),

              ],
            )));
  }

  LoginContent(this.vm);
}

class CheckBoxRememberMe extends StatefulWidget{
  final updateRememberMe;
  CheckBoxRememberMe({this.updateRememberMe});

  @override
  _CheckBoxState createState() => _CheckBoxState(updateRememberMe);

}

class _CheckBoxState extends State<CheckBoxRememberMe>{
  bool isChecked = false;

  final updateRememberMe;

  _CheckBoxState(this.updateRememberMe);

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: isChecked,
        activeColor: Colors.green,
        onChanged:(bool newValue){
          setState(() {
            isChecked = !isChecked;
            updateRememberMe(isChecked);
          });
        });
  }

}
