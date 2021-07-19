import 'package:bloc_architecture_app/presentation/screens/user_page/user_page.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: Strings.homeScreenTitle,
          ),
        );
      case 'user_page':
        return MaterialPageRoute(builder: (_) => UserPage());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
