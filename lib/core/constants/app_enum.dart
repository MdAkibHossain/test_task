import 'package:flutter/material.dart';

import '../utils/debug_utils.dart';

// final tkFormat =
//     NumberFormat.currency(locale: 'en_USD', name: '', decimalDigits: 0);
// NumberFormat.currency(
//     locale: 'bn_BD', name: '', decimalDigits: 2, symbol: '');

extension SUtil on BuildContext {
  TextStyle get h1 => Theme.of(this).textTheme.headline1!;
  TextStyle get h2 => Theme.of(this).textTheme.headline2!;
  TextStyle get h3 => Theme.of(this).textTheme.headline3!;
  TextStyle get h4 => Theme.of(this).textTheme.headline4!;
  TextStyle get h5 => Theme.of(this).textTheme.headline5!;
  TextStyle get h6 => Theme.of(this).textTheme.headline6!;
  TextStyle get caption => Theme.of(this).textTheme.caption!;
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1!;
  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2!;
  TextStyle? get body => Theme.of(this).textTheme.bodyLarge;
  TextStyle get button => Theme.of(this).textTheme.button!;
  // ButtonTheme get buttonTheme => Theme.of(this).buttonBarTheme.buto,
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  ElevatedButtonThemeData get elevatedTheme =>
      Theme.of(this).elevatedButtonTheme;
}

// extension Tk on num {
//   String tk() => "৳ ${tkFormat.format(this)}";
// }

extension Validator on String {
  // String tk() => "৳ ${tkFormat.format(double.parse(this))}";

  String? isValid(int characters, String filed) {
    if (length < characters) {
      return "$filed should be at least $characters character";
    } else if (isEmpty) {
      return "Please enter $filed";
    }
    return null;
  }

  String? isEmailORPhone() {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = RegExp(pattern);
    // if(int.tryParse(filed)){}
    // if (isEmpty) {
    //   return "$filed could not be empty";
    //
    logInfo(length.toString());
    if (int.tryParse(this).runtimeType == int) {
      if (!regExp.hasMatch(this)) {
        return "Invalid Phone Number ";
      }
    } else {
      return isEmail();
    }
    return null;
  }

  bool isTextPhone() {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = RegExp(pattern);

    if (int.tryParse(this).runtimeType == int) {
      return true;
    } else {
      return false;
    }
  }

  String? isValidGender(int characters, String filed) {
    if (length < characters) {
      return "Please select $filed";
    } else if (isEmpty) {
      return "Please Select $filed";
    }
    return null;
  }

  String? isValidDOB(DateTime? filed) {
    int? day = filed?.day;
    int? year = filed?.year;
    int? month = filed?.month;
    if (day == null || month == null || year == null) {
      return "Invalid Birth Day";
    }
    logError(filed.toString());
    return null;
  }

  String? isEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);

    if (!emailValid) {
      return "Please enter valid Email";
    }
    return null;
  }

  String? bothMatch(String other) {
    if (this != other) {
      return "Password didn't match";
    }
    return null;
  }

  String? isPhone() {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  bool isPhoneNumber() {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return false;
    } else if (length != 11) {
      return false;
    } else if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }
}

extension MessageUtil on BuildContext {
  void snackbar(String title, String message,
      [bool isError = false, Duration duration = const Duration(seconds: 1)]) {
    final Color color = isError ? Colors.redAccent : Colors.greenAccent;
    /*
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.horizontal,
      clipBehavior: Clip.none,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: bodyText1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: !isError ? Colors.white : Colors.black),
                      ),
                      Text(
                        message,
                        style: caption.copyWith(
                            color: !isError ? Colors.white : Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Positioned(
            top: -19,
            right: -10,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  */
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(SnackBar(
      backgroundColor: color,
      dismissDirection: DismissDirection.horizontal,
      clipBehavior: Clip.none,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      elevation: 0,
      // behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      padding: EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: bodyText1.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isError ? Colors.white : Colors.black),
          ),
          Text(
            message,
            style:
                caption.copyWith(color: isError ? Colors.white : Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      // content: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         color: color,
      //       ),
      //       height: 90,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           const SizedBox(width: 20),
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   title,
      //                   style: bodyText1.copyWith(
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.bold,
      //                       color: !isError ? Colors.white : Colors.black),
      //                 ),
      //                 Text(
      //                   message,
      //                   style: caption.copyWith(
      //                       color: !isError ? Colors.white : Colors.black),
      //                   maxLines: 2,
      //                   overflow: TextOverflow.ellipsis,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           const SizedBox(width: 10),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       top: -19,
      //       right: -10,
      //       child: InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(this).hideCurrentSnackBar();
      //         },
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: BoxDecoration(
      //             color: color,
      //             shape: BoxShape.circle,
      //           ),
      //           child: const Icon(
      //             Icons.close,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    ));
  }
}
