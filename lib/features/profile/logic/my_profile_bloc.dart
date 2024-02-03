import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/constants/secure_storage/app_constants.dart';
import 'package:my_task/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/api_endpoints.dart';
import '../../../../../core/data/dataproviders/dio_client.dart';
import '../../../../../core/exceptions/network_exceptions.dart';
import '../../../../../core/utils/debug_utils.dart';
import '../data/myprofile_data_model.dart';
import 'my_profile_event.dart';
import 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final ApiProvider? apiProvider;
  MyProfileBloc(this.apiProvider) : super(MyProfileInitialState()) {
    on<MyProfileFetched>((event, emit) async {
      logView("I am profile");

      emit(MyProfileLoadingState());
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString(USER_ID);
      String? token = prefs.getString(AUTH_TOKEN_KEY);
      var data = {"login": userId, "token": token};
      late MyProfileDataModel profiledata;
      await apiProvider
          ?.postCallWithOutToken(url: APIEndPoints.profile, data: data)
          .then((Either<DioError, Response> response) {
        response.fold((l) {
          logView('Mahmudul Check error for Token');

          logError(
              "Failed TO FETCHED Area Api  Repos! [${l.response?.statusCode}] -> [[${l.type.toString()}]]");
          final type = NetworkExceptions.getDioException(l);
          final message = NetworkExceptions.getErrorMessage(type);
          emit(MyProfileLoadingUnsuccessfulState(
            message: message,
          ));

          if (l.response?.statusCode == 500) {
            prefs.clear();
            Navigator.pushNamed(event.context, RouteName.loginScreen);
          }
        }, (r) {
          Map<String, dynamic> dataMap = r.data as Map<String, dynamic>;

          logView(dataMap.toString());

          profiledata = MyProfileDataModel.fromJson(dataMap);
        });
      });
      //
      await apiProvider
          ?.postCallWithOutToken(url: APIEndPoints.phone, data: data)
          .then((Either<DioError, Response> response) {
        response.fold((l) {
          logView('Mahmudul Check error for Token');

          logError(
              "Failed TO FETCHED Area Api  Repos! [${l.response?.statusCode}] -> [[${l.type.toString()}]]");
          final type = NetworkExceptions.getDioException(l);
          final message = NetworkExceptions.getErrorMessage(type);
          emit(MyProfileLoadingUnsuccessfulState(
            message: message,
          ));

          if (l.response?.statusCode == 500) {
            prefs.clear();
            Navigator.pushNamed(event.context, RouteName.loginScreen);
          }
        }, (r) {
          String data = r.data as String;
          logView("Phone");
          logView(data.toString());
          logView(profiledata.address.toString());
          // MyProfileDataModel profiledata = MyProfileDataModel.fromJson(dataMap);
          logView("check!!!!!!");
          emit(MyProfileLoadedState(profiledata: profiledata, phone: data));
        });
      });
    });
  }
}
