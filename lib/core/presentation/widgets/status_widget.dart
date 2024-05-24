import 'package:flutter/material.dart';
import 'package:myflix/core/utils/enums.dart';
import 'package:myflix/features/home/presentation/view/home_page.dart';
import 'package:myflix/views/offline_page.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus connectivityStatus =
        Provider.of<ConnectivityStatus>(context);
    if (connectivityStatus == ConnectivityStatus.online) {
      return const HomePage();
    } else {
      _showToastMessage("Offline");
      return const OfflinePage();
    }
  }

  void _showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
}
