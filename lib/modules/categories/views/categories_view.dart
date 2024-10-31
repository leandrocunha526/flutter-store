import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:corelab_app_challenge/core/ui/components/bottom_navigation_bar.dart';
import 'package:corelab_app_challenge/modules/categories/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<StatefulWidget> createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesView> {
  final CategoriesController controller = Modular.get();
  final List<String> categories = [
    "Anestésicos e Agulhas Gengivais",
    "Biosegurança",
    "Cimentos",
    "Cirurgia e Periodontia",
    "Dentística e Estética",
    "Descartáveis",
    "Endodontia",
    "Instrumentos",
    "Moldagem",
    "Ortodontia",
    "Periféricos e Peças de Mão",
    "Prótese",
    "Radiologia"
  ]; // Em ordem alfabética
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar:
          const BottomNavigationBarComponent(currentPage: Pages.categories),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Categorias",
                style: AppTextStyles().huge,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(color: AppColors.dividerGrey),
                ),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return CategoryItem(
                    categoryName: item,
                    onTap: () => controller.searchCategory(item),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: AppDivider(),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.onTap,
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
          child: Text(
            categoryName,
            style: AppTextStyles(
                    color: AppColors.defaultCyan, weight: FontWeight.w400)
                .larger,
          ),
        ),
      ),
    );
  }
}
