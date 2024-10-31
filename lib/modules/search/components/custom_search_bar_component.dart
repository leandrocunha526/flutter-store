import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:flutter/material.dart';
import 'package:corelab_app_challenge/modules/search/controllers/search_module_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/app_theme/app_text_styles.dart';
import '../../../core/ui/components/snack_bar.dart';

class CustomSearchBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final SearchModuleController controller;
  const CustomSearchBarComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultCyan,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ValueListenableBuilder(
            valueListenable: controller.searchResults,
            builder: (context, searchResults, child) => Row(
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                    controller.undoSearch();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                ),
                const Width(15),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          onChanged: (value) {
                            if (value == "") {
                              controller.undoSearch();
                            } else {
                              controller.search(value);
                            }
                          },
                          cursorColor: AppColors.defaultCyan,
                          controller: controller.searchTextEditingController,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.undoSearch();
                              },
                              child: Visibility(
                                visible: searchResults.isNotEmpty,
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.primaryGray,
                                ),
                              ),
                            ),
                            suffixIconConstraints:
                                const BoxConstraints(maxHeight: 25),
                            border: InputBorder.none,
                            hintText: '',
                            hintStyle: const TextStyle(
                                color: AppColors.secondaryGrey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchResults.isNotEmpty) ...[
                  const Width(15),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () => showSnackBar(
                          context: context,
                          message:
                              "Desculpe, este recurso não está disponível no momento."),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Filtros",
                          style: AppTextStyles(
                            weight: FontWeight.w700,
                            color: AppColors.white,
                          ).small,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
