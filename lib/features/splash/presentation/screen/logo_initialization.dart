import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/secure_storage/app_constants.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../route_name.dart';

class LogoInitialization extends StatefulWidget {
  const LogoInitialization({super.key});
  static const routeName = '/LogoInitialization';

  @override
  State<LogoInitialization> createState() => _LogoInitializationState();
}

class _LogoInitializationState extends State<LogoInitialization> {
  @override
  void initState() {
    __navigatetoUserAuth();
    super.initState();
  }

  Future<void> __navigatetoUserAuth() async {
    final prefs = await SharedPreferences.getInstance();

//
    //  prefs.clear();
//
    await Future.delayed(const Duration(
      milliseconds: 1600,
    )).then((value) {
      var isSkip = prefs.getString(AUTH_TOKEN_KEY);
      print(isSkip);

      if (isSkip != null) {
        Navigator.pushNamed(context, RouteName.dashboardScreen);
      } else if (isSkip == null) {
        print("here !!!!!!!");
        Navigator.pushNamed(context, RouteName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        AppAssets.appLogo,
        height: 22.0.h,
      )),
    );
  }
}
