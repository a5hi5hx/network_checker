library network_checker;

import 'package:flutter/material.dart';
import 'dart:io';

class NetworkChecker {
  Future<void> checkConnection(
      BuildContext context, String url, MaterialPageRoute route) async {
    try {
      final result = await InternetAddress.lookup(url);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // Connection available, navigate to the specified route
        Navigator.pushReplacement(context, route);
      }
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Internet Connection'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Unable to connect to the internet.'),
                Text('Please check your connection and try again.'),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
