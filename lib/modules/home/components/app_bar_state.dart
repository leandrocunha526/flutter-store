import 'package:corelab_app_challenge/core/routes/routes.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/modules/home/components/app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(widget.preferredSize.height),
        child: Container(
          color: AppColors.defaultCyan,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Modular.to.pushNamed(Routes.search);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  height: 38,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Buscar',
                          style: AppTextStyles(
                                  color: AppColors.secondaryGrey,
                                  weight: FontWeight.w400)
                              .medium,
                        ),
                        const Icon(Icons.search, color: AppColors.defaultCyan),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
