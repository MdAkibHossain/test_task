import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/model/page_arguments_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common_widget/common_network_image_widget.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../route_name.dart';
import '../../../profile/logic/my_profile_bloc.dart';
import '../../../profile/logic/my_profile_state.dart';
import 'drawer_menu_item.dart';
import 'logout_dialog.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  String userImage =
      "https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-profile-line-black-icon-png-image_691065.jpg";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          if (state is MyProfileLoadedState) {
            return Column(
              children: [
                SizedBox(
                  height: 21.0.h,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 8.w, bottom: 3.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   height: 5.5.h,
                          //   width: 5.5.h,
                          //   child: CommonNetworkImageWidget(
                          //     imageLink:
                          //         state.profileInfo.user!.photo.toString(),
                          //   ),
                          // ),
                          //      SizedBox(width: 8.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.profiledata!.name.toString(),
                                  maxLines: 2,
                                  softWrap: true,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  state.phone.toString(),
                                  style: TextStyle(fontSize: 11.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 4.h, right: 4.w),
                  child: Column(
                    children: [
                      DrawerMenuItem(
                        showDivider: true,
                        iconPath: Icons.person,
                        title: "Profile",
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteName.personalDetailsScreen,
                              arguments: PageRouteArguments(
                                  myProfileDataModel: state.profiledata,
                                  data: state.phone));
                        },
                      ),
                      DrawerMenuItem(
                        showDivider: true,
                        iconPath: Icons.logout,
                        title: "Log Out",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => _showLogoutDialog(context),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _showLogoutDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: SizedBox(
          width: 77.0.w, height: 60.0.h, child: const CustomLogoutDialog()),
    );
  }
}
