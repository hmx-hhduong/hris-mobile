import 'package:connectivity/connectivity.dart';

Future<void> checkInternetConnection() async {
  if (await Connectivity().checkConnectivity() == ConnectivityResult.none){
    throw Exception();
  }

}
