import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/business/common/popup_action.dart';
import 'package:hris_mobile/client/login/login_viewmodel.dart';

class LoginConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
//      converter: (store) => LoginViewModel.fromStore(store),
      vm: Factory(),
      onDidChange: (LoginViewModel vm) {
        if (vm.popupModel != null) {
          if (vm.popupModel.title != '') {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(vm.popupModel.title),
                    content: Text(vm.popupModel.message),
                    actions: [
                      TextButton(
                          child: Text(vm.popupModel.titleButton1),
                          onPressed: () {
                            StoreProvider.dispatch<AppState>(
                                context, PopupAction(title: ''));
                            Navigator.of(context).pop();
                          })
                    ],
                  );
                });
          }
        }
      },
      builder: (BuildContext context, LoginViewModel viewModel) =>
          LoginContent(viewModel),
    );
  }
}

class LoginContent extends StatelessWidget {
  final LoginViewModel vm;
  bool isChecked = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool checkBoxValue = false;

  updateRememberMe(value) {
    isChecked = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Stack(
            children: [
              Opacity(
                  opacity: vm.isWatting ? 0.5 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
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
                        height: 40,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          vm.error ?? '',
                          style: TextStyle(
                              color: Colors.red, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CheckBoxRememberMe(
                              updateRememberMe: updateRememberMe),
                          Text('Remember me')
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            vm.onSubmit(nameController.text,
                                passwordController.text, true);
                          },
                        ),
                      ),
                    ],
                  )),
              Center(
                  child:
                      vm.isWatting ? CircularProgressIndicator() : Container()),
            ],
          ),
        ));
  }

  LoginContent(this.vm);
}

class CheckBoxRememberMe extends StatefulWidget {
  final updateRememberMe;
  CheckBoxRememberMe({this.updateRememberMe});

  @override
  _CheckBoxState createState() => _CheckBoxState(updateRememberMe);
}

class _CheckBoxState extends State<CheckBoxRememberMe> {
  bool isChecked = false;

  final updateRememberMe;

  _CheckBoxState(this.updateRememberMe);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        activeColor: Colors.green,
        onChanged: (bool newValue) {
          setState(() {
            isChecked = !isChecked;
            updateRememberMe(isChecked);
          });
        });
  }
}
