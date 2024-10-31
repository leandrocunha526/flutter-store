import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:corelab_app_challenge/core/ui/components/width.dart';

class ItemSearchComponent extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  const ItemSearchComponent({
    super.key,
    required this.onTap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.history,
                color: AppColors
                    .tertiaryCyan, //https://en.wikipedia.org/wiki/Category:Tertiary_colors
              ),
              const Width(14),
              Expanded(
                child: Text(
                  name,
                  style: AppTextStyles(
                    weight: FontWeight.w400,
                    color: AppColors.tertiaryCyan,
                  ).large,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
