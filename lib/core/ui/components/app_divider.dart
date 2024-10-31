import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColors.dividerGrey,
      width: double.infinity,
    );
  }
}
