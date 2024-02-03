// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:my_task/core/global_bloc/login/logic/login_bloc/log_in_bloc.dart';
import 'package:my_task/features/splash/presentation/screen/logo_initialization.dart';

import 'core/data/dataproviders/dio_client.dart';
import 'features/dashboard/logic/trade_list_bloc/trade_list_bloc.dart';
import 'features/profile/logic/my_profile_bloc.dart';
import 'on_generate_route.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInBloc>(
          create: (context) => LogInBloc(
            ApiProvider(),
          ),
        ),
        BlocProvider<MyProfileBloc>(
          create: (context) => MyProfileBloc(
            ApiProvider(),
          ),
        ),
        BlocProvider<TradeListBloc>(
          create: (context) => TradeListBloc(
            ApiProvider(),
          ),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Apple Gadgets BD',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LogoInitialization(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGeneratedRoute,
            builder: (context, router) => router!,
          );
        },
      ),
    );
  }
}
