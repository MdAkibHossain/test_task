import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/model/page_arguments_model.dart';
import 'package:my_task/core/utils/debug_utils.dart';
import 'package:my_task/features/profile/data/myprofile_data_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common_widget/common_app_bar_with_back.dart';
import '../../../../core/common_widget/common_text_input.dart';
import '../../../../core/utils/app_colors.dart';
import '../../logic/my_profile_bloc.dart';
import '../../logic/my_profile_event.dart';
import '../../logic/my_profile_state.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({
    super.key,
    required this.arguments,
  });
  final PageRouteArguments arguments;
  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<MyProfileBloc>(context)
        .add(MyProfileFetched(context: context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBarWithBack(
          height: 6.5.h,
          title: 'Profile',
        ),
        body: SingleChildScrollView(
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // if you need this
              // side: BorderSide(
              //   color: Colors.grey.withOpacity(0.1),
              //   width: 1,
              // ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 3.0.w,
                right: 3.0.w,
                top: 2.0.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _accountDetailsItem(
                    title: 'Name',
                    titleValue:
                        widget.arguments.myProfileDataModel!.name.toString(),
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'Phone',
                    titleValue: widget.arguments.data.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'Banlance',
                    titleValue:
                        widget.arguments.myProfileDataModel!.balance.toString(),
                    // textColor: AppColors.primaryColor
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: "Currency",
                    titleValue: widget.arguments.myProfileDataModel!.currency
                        .toString(),
                    // textColor: AppColors.primaryColor
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'CurrentTradesVolume',
                    titleValue: widget
                        .arguments.myProfileDataModel!.currentTradesVolume
                        .toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'TotalTradesVolume',
                    titleValue: widget
                        .arguments.myProfileDataModel!.totalTradesVolume
                        .toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'Equity',
                    titleValue:
                        widget.arguments.myProfileDataModel!.equity.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'IsSwapFree',
                    titleValue: widget.arguments.myProfileDataModel!.isSwapFree
                        .toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'FreeMargin',
                    titleValue: widget.arguments.myProfileDataModel!.freeMargin
                        .toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'VerificationLevel',
                    titleValue: widget
                        .arguments.myProfileDataModel!.verificationLevel
                        .toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'City',
                    titleValue:
                        widget.arguments.myProfileDataModel!.city.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'Country',
                    titleValue:
                        widget.arguments.myProfileDataModel!.country.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'ZipCode',
                    titleValue:
                        widget.arguments.myProfileDataModel!.zipCode.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                  _accountDetailsItem(
                    title: 'Address',
                    titleValue:
                        widget.arguments.myProfileDataModel!.address.toString(),
                    // textColor: AppColors.color707070
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _accountDetailsItem({
    required String title,
    required String titleValue,
  }) {
    return Container(
      //    margin: EdgeInsets.symmetric(vertical: 1.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.0.sp,
              color: AppColors.color7C7C7C,
            ),
          ),
          // SizedBox(height: 1.0.h),
          Text(
            titleValue,
            style: TextStyle(
              fontSize: 12.0.sp,
              color: AppColors.color030303,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
