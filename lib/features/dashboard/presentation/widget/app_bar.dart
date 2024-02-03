import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  DashboardAppBar({
    required this.height,
    this.onPressed,
    Key? key,
    required this.title,
    this.leading,
    this.showAction = false,
    this.onRefresh,
  }) : super(key: key);

  final Widget? leading;
  final double height;
  void Function()? onPressed;
  final String title;
  final bool showAction;
  void Function()? onRefresh;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _appbar(context);
  }

  Widget _appbar(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff2a2962),
        Color.fromARGB(255, 61, 59, 156),
      ])),
      child: Center(
        child: AppBar(
          // foregroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(title,
              style: TextStyle(color: Colors.white, fontSize: 18.sp)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: showAction
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: SizedBox(
                      child: IconButton(
                          onPressed: onRefresh,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 4.0.h,
                          )),
                    ),
                  ),
                  SizedBox(width: 1.0.w),
                ]
              : null,
          leading: leading ??
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepPurple,
                    size: 30,
                  )),
        ),
      ),
    );
  }
}
