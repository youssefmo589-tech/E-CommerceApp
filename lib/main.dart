import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce/core/AppRoutes/AppRoutesName/AppRouteName.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/AppRoutes/AppRoutesConfig/AppConfig.dart';
import 'core/Services/EasyLoadingService.dart';
import 'core/Theme/AppThemeManager/AppThemeManager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());

  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(builder: BotToastInit()),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.initial,
      onGenerateRoute: AppConfig.onGenerateRoute,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
