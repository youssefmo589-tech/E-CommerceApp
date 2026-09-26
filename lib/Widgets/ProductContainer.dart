import 'package:flutter/material.dart';

import '../core/Theme/AppColors/AppColors.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      width: 122,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Holding Mobile Mockup 01.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text(
                    "Mulberry Clutch",
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.blackapp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Series 7",
                    style: theme.titleSmall?.copyWith(
                      color: AppColors.darkgrey,
                    ),
                  ),
                  Text(
                    "777",
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.darkpurple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
