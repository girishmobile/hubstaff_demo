import 'package:demo/core/router/route_name.dart';
import 'package:demo/screen/auth/signup/signup_view.dart';

import 'package:demo/screen/auth/forgot/forgot_password_view.dart';
import 'package:demo/screen/auth/login/login_view.dart';
import 'package:demo/screen/view/main_screen.dart';
import 'package:demo/screen/view/page/expenses/expenses_view.dart';
import 'package:demo/splash_screen.dart';

import 'package:flutter/material.dart';

class RouterGenerated {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case dashboardScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case expensesView:
        return MaterialPageRoute(
            builder: (_) => const ExpensesView(isButtonShow: true));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
