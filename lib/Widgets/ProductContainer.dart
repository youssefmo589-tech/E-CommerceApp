import 'package:flutter/material.dart';

import '../core/Theme/AppColors/AppColors.dart';
import '../features/layoutView/datalayer/Models/ProductModel.dart';

class ProductContainer extends StatelessWidget {
  final ProductModel product;

  ProductContainer({super.key, required this.product});

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
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 3,
                children: [
                  Text(
                    product.title,
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.blackapp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Stock ${product.stock}",
                    style: theme.titleSmall?.copyWith(
                      color: AppColors.darkgrey,
                    ),
                  ),
                  Text(
                    "${product.price}",
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
