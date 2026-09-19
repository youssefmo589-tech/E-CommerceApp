import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:ecommerce/features/auth/presentation/Login.dart';
import 'package:flutter/material.dart';

import '../../../features/splashScreen/SplashScreen.dart';

class AppConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.initial:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
      case AppRouteName.login:
        return MaterialPageRoute(builder: ((context) => LoginPage()));
    }
  }
}
