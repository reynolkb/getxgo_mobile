import 'package:bloc_architecture_app/presentation/screens/login_page.dart';
import 'package:bloc_architecture_app/presentation/screens/reset_password_page.dart';
import 'package:bloc_architecture_app/presentation/screens/signup_page.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen.dart';

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
      case 'sign_up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'user_page':
        return MaterialPageRoute(builder: (_) => UserPage());
      case 'reset_password':
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
