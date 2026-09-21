import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:ecommerce/features/auth/presentation/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/manager/AuthBloc.dart';
import '../../../features/auth/presentation/pages/signUp.dart';
import '../../../features/splashScreen/SplashScreen.dart';

class AppConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.initial:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));

      case AppRouteName.signUp:
        return MaterialPageRoute(builder: ((context) =>
            BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
                child: SignUp())));


      case AppRouteName.login:
        return MaterialPageRoute(builder: ((context) =>
            BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
                child: LoginPage())));
    }
  }
}
