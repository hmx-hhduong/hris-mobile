import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:hris_mobile/business/app/app_state.dart';
import 'package:hris_mobile/client/login/login_connector.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hris_mobile/client/main/main_connector.dart';

import 'business/store.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final storage = new FlutterSecureStorage();

Future<void> main() {
  NavigateAction.setNavigatorKey(navigatorKey);
  final store = createStore();

  runApp(HrisApp(store));
}

final routes = {
  "/": (BuildContext context) => Splash(),
  "/login": (BuildContext context) => LoginConnector(),
  "/home": (BuildContext context) => MainConnector(),
};

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
        routes: routes,
        navigatorKey: navigatorKey,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => {
          storage.read(key: 'token').then((value) => {
                if (value != null)
                  {
                    widget.store
                        .dispatch(NavigateAction.pushReplacementNamed("/home"))
                  }
                else
                  {
                    widget.store
                        .dispatch(NavigateAction.pushReplacementNamed("/login"))
                  }
              })
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
