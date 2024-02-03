import 'package:flutter/material.dart';
import 'package:my_task/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'core/model/page_arguments_model.dart';
import 'features/authentication/presentation/screen/login_screen.dart';
import 'features/profile/presentation/view/personal_details_screen.dart';
import 'features/splash/presentation/screen/logo_initialization.dart';
import 'route_name.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case RouteName.root:
        // var arg = route.arguments as PageRouteArguments;
        return PageTransition(
          child: const LogoInitialization(),
          type: PageTransitionType.fade,
        );
      case RouteName.loginScreen:
        // var arg = route.arguments as PageRouteArguments;
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
        );
      case RouteName.dashboardScreen:
        // var arg = route.arguments as PageRouteArguments;
        return PageTransition(
          child: const DashboardScreen(),
          type: PageTransitionType.fade,
        );
      case RouteName.personalDetailsScreen:
        var arg = route.arguments as PageRouteArguments;
        return PageTransition(
          child: PersonalDetailsScreen(arguments: arg),
          type: PageTransitionType.fade,
        );

      default:
        return _errorRoute();
    }
  }

  // AppRouter._(); CheckOutScreen
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("ERROR"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Page not found!"),
        ),
      ),
    );
  }
}
