import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:flutter/material.dart';

import 'core/AppRoutes/AppRoutesConfig/AppConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouteName.initial,
      onGenerateRoute: AppConfig.onGenerateRoute,
    );
  }
}
