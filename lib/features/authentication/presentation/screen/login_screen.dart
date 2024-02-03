import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/constants/app_enum.dart';
import 'package:my_task/core/global_bloc/login/logic/login_bloc/log_in_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';
import '../../../../core/common_widget/common_app_exit_show_dialog.dart';

import '../../../../core/constants/secure_storage/app_constants.dart';
import '../../../../core/global_bloc/login/logic/login_bloc/log_in_bloc.dart';
import '../../../../core/global_bloc/login/logic/login_bloc/log_in_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/loginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final _userIdController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  bool isAgree = true;
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CommonOnWillPop(context: context, isToHome: false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h),
                child: Image.asset(
                  AppAssets.appLogo,
                  height: 22.0.h,
                )),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 2.5.h, bottom: 1.0.h),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.color181725,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 2.5.h),
              child: Text(
                "Enter Your phone & Password",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.color7C7C7C,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            SingleChildScrollView(
              child: BlocListener<LogInBloc, LogInState>(
                listener: (context, state) async {
                  if (state is LogInUnsuccessful) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(20),
                        shape: const StadiumBorder(),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          disabledTextColor: Colors.white,
                          textColor: Colors.red,
                          onPressed: () {
                            //Do whatever you wa nt
                          },
                        ),
                      ),
                    );
                  } else if (state is LogInSuccessful) {
                    FocusManager.instance.primaryFocus?.unfocus();

                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString(AUTH_TOKEN_KEY, state.token!);
                    prefs.setString(USER_ID, _userIdController.text);

                    Navigator.of(context)
                        .popAndPushNamed(RouteName.dashboardScreen);
                  }
                },
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 1.0.h),
                          child: TextFormField(
                            controller: _userIdController,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.color707070,
                            validator: (value) {
                              if (value == null || value == "") {
                                return "Cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "Phone",
                                style: TextStyle(color: AppColors.color707070),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.0.w,
                            right: 5.0.w,
                            // top: 3.0.h,
                            bottom: 1.0.h,
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _isObscure,
                            keyboardType: TextInputType.text,
                            cursorColor: AppColors.color707070,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                child: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: AppColors.color707070),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isAgree,
                                onChanged: (value) {
                                  setState(() {
                                    isAgree = !isAgree;
                                  });
                                }),
                            RichText(
                              text: TextSpan(
                                text: "I have agreed to ",
                                style: const TextStyle(
                                    fontSize: 12, color: AppColors.color707070),
                                children: [
                                  TextSpan(
                                      text: "Terms and Conditions",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.color707070,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.0.w,
                            right: 3.0.w,
                            top: 3.0.h,
                            bottom: 1.5.h,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              minimumSize: Size(100.w, 7.5.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              if (!isAgree) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(
                                      child: Text(
                                          "Please agree to the Terms and Conditions."),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.all(20),
                                    shape: const StadiumBorder(),
                                  ),
                                );
                              } else {
                                if (_userIdController.text.isNotEmpty &&
                                    _passwordController.text.isNotEmpty) {
                                  context.read<LogInBloc>().add(LoginEvent(
                                        userId: _userIdController.text,
                                        password: _passwordController.text,
                                      ));
                                } else {
                                  context.snackbar(
                                      'Provide proper data!', '', true);
                                }
                              }
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
