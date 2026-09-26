import 'package:flutter/material.dart';

import '../core/Theme/AppColors/AppColors.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(color: AppColors.darkpurple),
          child: Center(
            child: Text(
              "E-CommerceApp",
              style: theme.titleLarge?.copyWith(
                color: AppColors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,

            decoration: BoxDecoration(color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.home_filled, size: 24, color: AppColors.black),
                      Text(
                        "Go to Home",
                        style: theme.titleMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: AppColors.black, height: 1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
