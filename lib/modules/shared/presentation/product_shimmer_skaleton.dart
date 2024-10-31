import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:corelab_app_challenge/core/ui/components/shimmer_widget.dart';
import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:flutter/material.dart';

class ProductShimmerSkeletonWidget extends StatelessWidget {
  const ProductShimmerSkeletonWidget({super.key});
  Widget itemWidget() {
    return Column(
      children: [
        const AppDivider(),
        Container(
          color: AppColors.white,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                ShimmerWidget.rectangular(height: 100, width: 100),
                Width(16),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(height: 20, width: 220),
                      Height(6),
                      ShimmerWidget.rectangular(height: 20, width: 80),
                      Height(4),
                      ShimmerWidget.rectangular(height: 20, width: 170),
                      Height(6),
                      ShimmerWidget.rectangular(height: 20, width: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => itemWidget(),
      shrinkWrap: true,
      itemCount: 10,
    );
  }
}
