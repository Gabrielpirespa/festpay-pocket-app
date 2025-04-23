import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/core/widgets/skeleton_container.dart';
import 'package:flutter/material.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SkeletonContainer(
                height: 120,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: SkeletonContainer(
                height: 20,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: SkeletonContainer(
                height: 20,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 59),
              child: SkeletonContainer(
                height: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
