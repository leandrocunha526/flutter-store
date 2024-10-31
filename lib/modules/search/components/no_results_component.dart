import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_images.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:flutter/material.dart';

class NoResultsComponent extends StatelessWidget {
  final String search;
  const NoResultsComponent({
    super.key,
    required this.search,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 345,
        child: Column(
          children: [
            const Height(78),
            AppImages.noResults.image(height: 200),
            const Height(18),
            Text(
              "Resultado não encontrado",
              style: AppTextStyles().larger,
              textAlign: TextAlign.center,
            ),
            const Height(10),
            Text(
              "Não encontramos nenhum resultado parecido com \"$search\".",
              style: AppTextStyles(color: AppColors.tertiaryCyan).medium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
