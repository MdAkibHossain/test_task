import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/constants/api_endpoints.dart';
import '../../../../data/dataproviders/dio_client.dart';
import '../../../../exceptions/network_exceptions.dart';
import '../../../../utils/debug_utils.dart';
import '../../data/user_info_model.dart';
import 'log_in_event.dart';
import 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final ApiProvider? apiProvider;
  LogInBloc(
    this.apiProvider,
  ) : super(LogInInitial()) {
    //// SignIn  ////
    on<LoginEvent>((event, emit) async {
      logView('i am LogIn');
      emit(LogInLoading());

      var signInData = {"login": event.userId, "password": event.password};
      await apiProvider
          ?.postCallWithOutToken(url: APIEndPoints.login, data: signInData)
          .then((Either<DioError, Response> response) {
        response.fold((l) {
          logError(
              "Failed TO FETCHED [${l.response?.statusCode}] -> [[${l.type.toString()}]]");
          final type = NetworkExceptions.getDioException(l);
          final message = NetworkExceptions.getErrorMessage(type);

          emit(LogInUnsuccessful(
            message: message,
          ));
          logView("check here");
        }, (r) {
          //    List<CategoryDataModel> categoryData = [];
          //return data type, it will be list or map .
          Map<String, dynamic> dataMap = r.data as Map<String, dynamic>;

          logView(dataMap.toString());

          emit(LogInSuccessful(token: dataMap['token']));
        });
      });
    });
  }
}
