import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/constants/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/secure_storage/app_constants.dart';
import '../../../../core/data/dataproviders/dio_client.dart';
import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../core/utils/debug_utils.dart';
import '../../../../route_name.dart';
import '../../data/trade_list_data_model.dart';
import 'trade_list_event.dart';
import 'trade_list_state.dart';

class TradeListBloc extends Bloc<TradeListEvent, TradeListState> {
  final ApiProvider? apiProvider;
  TradeListBloc(
    this.apiProvider,
  ) : super(TradeListInitial()) {
    //// SignIn  ////
    on<TradeListFetchEvent>((event, emit) async {
      logView('i am TradeList');
      emit(TradeListLoading());
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString(USER_ID);
      String? token = prefs.getString(AUTH_TOKEN_KEY);

      var data = {"login": userId, "token": token};

      await apiProvider
          ?.postCallWithOutToken(url: APIEndPoints.tradeList, data: data)
          .then((Either<DioError, Response> response) {
        response.fold((l) {
          logError(
              "Failed TO FETCHED Area Api  Repos! [${l.response?.statusCode}] -> [[${l.type.toString()}]]");
          final type = NetworkExceptions.getDioException(l);
          final message = NetworkExceptions.getErrorMessage(type);

          if (l.response?.statusCode == 500) {
            ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                content: Text("Session expired please re-login!"),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(15),
                //  shape: const StadiumBorder(),
              ),
            );
            prefs.clear();
            Navigator.pushNamed(event.context, RouteName.loginScreen);
          }

          emit(TradeListUnsuccessful(
            message: message,
          ));
        }, (r) {
          List<TradeListDataModel> tradeListData = [];
          List<dynamic> dataMap = r.data as List<dynamic>;
          logView(dataMap.toString());

          dataMap.forEach((dynamic data) {
            TradeListDataModel datas = TradeListDataModel.fromJson(data);
            tradeListData.add(datas);
          });
          logView(tradeListData.length.toString());
          double total = 0; // Initialize total to 0 instead of null
          for (int i = 0; i < tradeListData.length; i++) {
            total += (tradeListData[i].profit ??
                0); // Safely add profit to total, handling nulls
          }

          logView(total.toString());
          emit(TradeListSuccessful(tradeListData: tradeListData, total: total));
        });
      });
    });
  }
}
