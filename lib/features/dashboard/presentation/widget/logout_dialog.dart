import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../route_name.dart';

class CustomLogoutDialog extends StatefulWidget {
  // final Function() dataDidUpdated;

  const CustomLogoutDialog(
      {
      // required this.title,
      // required this.dataDidUpdated,
      // required this.postId,
      Key? key})
      : super(key: key);

  @override
  _CustomLogoutDialogState createState() => _CustomLogoutDialogState();
}

class _CustomLogoutDialogState extends State<CustomLogoutDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
                width: double.infinity,
                child: Center(
                    child: Image.asset(
                  AppAssets.appLogo,
                  height: 22.0.h,
                ))),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Want To Logout Now?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "You will exit from the app if you click the logout button",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.color525252,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
                onTap: () {
                  //  widget.dataDidUpdated();
                  Navigator.pop(context);
                },
                child: Container(
                    height: 5.4.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Cencel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.00.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () async {
                (await SharedPreferences.getInstance()).clear();
                Navigator.pushNamed(
                  context,
                  RouteName.loginScreen,
                );
              },
              child: Text(
                "Log Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
