// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:openidconnect/openidconnect.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../constants/api_endpoints.dart';
// import '../../constants/secure_storage/app_constants.dart';
// import '../../data/dataproviders/dio_client.dart';
// import '../../model/user.dart';
// import '../../utils/debug_utils.dart';

// class AuthService {
//   Future<OpenIdConnectClient> openIdClient() async {
//     return await OpenIdConnectClient.create(
//         discoveryDocumentUrl:
//             "https://amarshohorbeta.com/.well-known/openid-configuration",
//         clientId: "VbjGLwZ20pdlKYDr05iF1n7i4ApHH",
//         redirectUrl: "com.example.futterauth:/oauth2redirect",
//         scopes: ['openid', 'profile', 'offline_access']);
//   }

//   Future<int> currentTokenExpiresAt() async {
//     return (await SharedPreferences.getInstance())
//             .getInt(AUTH_TOKEN_EXPIRES_AT) ??
//         0;
//     // return 0;
//   }

//   Future<bool> isTokenValid() async {
//     final expiresAt = await currentTokenExpiresAt();
//     print('tokenIsT $expiresAt');
//     return expiresAt > DateTime.now().microsecondsSinceEpoch;
//   }

//   Future<bool> isAuthenticated() async {
//     final token =
//         (await SharedPreferences.getInstance()).getString(AUTH_TOKEN_KEY);
//     print('tokenA $token');
//     final isValid = await isTokenValid();
//     return token != null && isValid;
//   }

//   Future<String?> getAuthToken() async {
//     return (await SharedPreferences.getInstance()).getString(AUTH_TOKEN_KEY);
//   }

//   Future<UserDataModel?> getAuthUser() async {
//     final authenticated = await isAuthenticated();
//     if (authenticated) {
//       final storage = await SharedPreferences.getInstance();
//       final userInfo = storage.getString(AUTH_USER_DATA);
//       if (userInfo != null) {
//         print(userInfo);
//         return UserDataModel.fromJson(jsonDecode(userInfo));
//       }
//       // final token = await getAuthToken();
//       UserDataModel? user;
//       final response =
//           await ApiProvider().getCallWithToken(url: APIEndPoints.userData);
//       response.fold((l) {}, (r) {
//         Map<String, dynamic> dataMap = r.data['data'] as Map<String, dynamic>;
//         logView(r.data['data'].toString());
//         storage.setString(AUTH_USER_DATA, jsonEncode(dataMap));
//         //  print(storage.getString(AUTH_USER_DATA));
//         user = UserDataModel.fromJson(dataMap);
//       });
//       return user;
//     }
//     return null;
//   }

//   Future<void> logout() async {
//     final storage = await SharedPreferences.getInstance();
//     storage.remove(AUTH_USER_DATA);
//     storage.remove(AUTH_TOKEN_KEY);
//     storage.remove(AUTH_TOKEN_EXPIRES_AT);
//     // storage.remove(AUTH_RERESH_KEY);
//   }

//   authAction(
//       {required VoidCallback authorisedAction,
//       VoidCallback? alternativeAction}) async {
//     if (await isAuthenticated()) {
//       authorisedAction();
//     } else {
//       if (alternativeAction != null) alternativeAction();
//     }
//   }

//   void refreshAuthToken() async {
//     final client = await openIdClient();
//     Timer.periodic(const Duration(minutes: 5), (timer) async {
//       if (await isAuthenticated()) {
//         final storage = await SharedPreferences.getInstance();
//         final request = RefreshRequest(
//             configuration: client.configuration!,
//             scopes: client.scopes,
//             clientId: client.clientId,
//             clientSecret: client.clientSecret,
//             autoRefresh: true,
//             refreshToken: storage.getString(AUTH_RERESH_KEY)!);

//         final response = await OpenIdConnect.refreshToken(request: request);
//         print('access token refreshed');

//         storage.setString(AUTH_TOKEN_KEY, response.accessToken);
//         storage.setString(AUTH_RERESH_KEY, response.refreshToken!);
//         storage.setInt(
//             AUTH_TOKEN_EXPIRES_AT, response.expiresAt.microsecondsSinceEpoch);
//       }
//     });
//   }
// }
