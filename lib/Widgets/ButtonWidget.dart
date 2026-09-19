import 'package:flutter/material.dart';

import '../core/Theme/AppColors/AppColors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;

  ButtonWidget({super.key, required this.title});

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkpurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: theme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
