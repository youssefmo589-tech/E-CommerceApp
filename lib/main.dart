import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:flutter/material.dart';

import 'core/AppRoutes/AppRoutesConfig/AppConfig.dart';
import 'core/Theme/AppThemeManager/AppThemeManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouteName.initial,
      onGenerateRoute: AppConfig.onGenerateRoute,
      theme: AppThemeManager.lightTheme,
      darkTheme:,
      themeMode: ThemeMode.light,
    );
  }
}
