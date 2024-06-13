import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  Connectivity connectivity = Connectivity();

  StreamController<bool> networkStatusController = StreamController<bool>();
  Stream<bool> get networkStatus => networkStatusController.stream;

  ConnectivityService() {
    connectivity.onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  bool _getNetworkStatus(ConnectivityResult status) {
    return status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi;
  }
}
