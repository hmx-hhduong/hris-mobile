import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/client/login/login_connector.dart';

import 'business/store.dart';

void main() {
  final store = createStore();
  runApp(HrisApp(store));
}

class HrisApp extends StatefulWidget {
  final Store<AppState> store;

  HrisApp(this.store);

  @override
  _HrisAppState createState() => _HrisAppState();
}

class _HrisAppState extends State<HrisApp> {

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Hris',
        home: LoginConnector(),
      ),
    );
  }
}
