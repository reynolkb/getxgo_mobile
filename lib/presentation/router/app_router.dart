import 'package:bloc_architecture_app/presentation/screens/getxgo_home.dart';
import 'package:bloc_architecture_app/presentation/screens/login_page.dart';
import 'package:bloc_architecture_app/presentation/screens/ready_guide.dart';
import 'package:bloc_architecture_app/presentation/screens/reset_password_page.dart';
import 'package:bloc_architecture_app/presentation/screens/signup_page.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'sign_up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'user_page':
        return MaterialPageRoute(builder: (_) => UserPage());
      case 'reset_password':
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      case 'ready_guide':
        return MaterialPageRoute(builder: (_) => ReadyGuide());
      case 'getxgo_home':
        return MaterialPageRoute(builder: (_) => GetxgoHome());
      default:
        return null;
    }
  }
}
