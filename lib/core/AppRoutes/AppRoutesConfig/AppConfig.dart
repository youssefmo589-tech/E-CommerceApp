import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:ecommerce/core/splashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.initial:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
    }
  }
}
