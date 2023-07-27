import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ConnectivityService extends GetxController {
  final Connectivity _connectivity = Connectivity();

  RxBool hasInternetConnection = false.obs;
  showAlert(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
          },
          child: Text(
            'OK',
            style: TextStyle(color: kblack),
          ),
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      checkInternetConnection();
    });
  }

  Future<void> checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    hasInternetConnection.value = connectivityResult != ConnectivityResult.none;
  }
}
