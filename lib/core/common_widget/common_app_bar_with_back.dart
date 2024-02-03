import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

// ignore: must_be_immutable
class CommonAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  //void Function()? onPressed;
  //void Function() filterPressed;
  final String title;

  const CommonAppBarWithBack({
    required this.height,
    // required this.onPressed,
    // required this.filterPressed,
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _appbar(context);
  }

  Widget _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.0.w,
          ),
          Image.asset(
            AppAssets.appLogo,
            height: 2.5.h,
            // width: 10.w,
          ),
          SizedBox(
            width: 1.5.w,
          ),
          Text(title, style: const TextStyle(color: Colors.black)),
        ],
      ),
      backgroundColor: AppColors.white,
      // actions: [
      //   GestureDetector(
      //     onTap: () {
      //       filterPressed();
      //       //   Navigator.pushNamed(context, RouteName.filterScreen);
      //       print("object");
      //     },
      //     child: const SizedBox(
      //       child: Icon(
      //         Icons.filter_alt,
      //         // color: AppColors.primaryColor,
      //       ),
      //     ),
      //   ),
      //   const SizedBox(
      //     width: 16,
      //   ),
      // ],
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          )),
      //  IconButton(
      //   icon: const Icon(Icons.menu),
      //   color: Colors.black,
      //   onPressed: onPressed,
      // ),
    );
  }
}
