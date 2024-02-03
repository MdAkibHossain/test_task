import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route_name.dart';

// ignore: non_constant_identifier_names
Future<bool> CommonOnWillPop(
    {required BuildContext context, required bool isToHome}) async {
//Future OnWillPop(BuildContext context) async {
  return isToHome
      ? Navigator.pushNamed(context, RouteName.dashboardScreen)
      // (await showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: new Text('Are you sure?'),
      //       content: new Text('Do you want to exit an App'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () => Navigator.of(context).pop(false),
      //           child: new Text('No'),
      //         ),
      //         TextButton(
      //           //    onPressed: () => Navigator.of(context).pop(true),
      //           child: new Text('Yes'),

      //           onPressed: () {
      //             if (Platform.isAndroid) {
      //               SystemNavigator.pop();
      //             } else if (Platform.isIOS) {
      //               exit(0);
      //             }
      //           },
      //         ),
      //       ],
      //     ),
      //   ))
      : (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                TextButton(
                  //    onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),

                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                ),
              ],
            ),
          )) ??
          false;
}
