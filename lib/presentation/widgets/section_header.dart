import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor),
        ),
        TextButton(
            onPressed: onTapSeeAll,
            child: const Text(
              'See all',
              style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
            ))
      ],
    );
  }
}
