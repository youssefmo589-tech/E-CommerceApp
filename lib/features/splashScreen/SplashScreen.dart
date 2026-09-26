import 'package:flutter/material.dart';

import '../../core/AppRoutes/AppRoutesName/AppRouteName.dart';
import '../../core/Theme/AppColors/AppColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteName.LayoutViewPage,
        (route) => false,
      );
    });
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.darkpurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "E-CommerceApp",
            style: theme.titleLarge?.copyWith(
              color: AppColors.whiteapp,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
