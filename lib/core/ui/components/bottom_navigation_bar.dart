import 'package:corelab_app_challenge/core/routes/routes.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_icons.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'snack_bar.dart';

enum Pages { announce, account, categories, favorites, home }

class BottomNavigationBarComponent extends StatefulWidget {
  final Pages currentPage;

  const BottomNavigationBarComponent({super.key, required this.currentPage});

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarComponent> {
  onUnavailableFeatureTap() => showSnackBar(
        context: context,
        message: 'Desculpe, este recurso não está disponível no momento.',
      );

  onHomeTap() {
    Modular.to.navigate(Routes.home);
  }

  onCategoriesTap() {
    Modular.to.navigate(Routes.categories);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 80),
          child: Row(
            children: [
              _buttonNavigation(
                icon: AppIcons.home,
                onTap: onHomeTap,
                label: "Home",
                isSelected: widget.currentPage == Pages.home,
              ),
              _buttonNavigation(
                icon: AppIcons.categories,
                onTap: onCategoriesTap,
                label: "Categorias",
                isSelected: widget.currentPage == Pages.categories,
              ),
              _buttonNavigation(
                icon: AppIcons.announce,
                onTap: onUnavailableFeatureTap,
                label: "Anunciar",
                isSelected: widget.currentPage == Pages.announce,
              ),
              _buttonNavigation(
                icon: AppIcons.favorite,
                onTap: onUnavailableFeatureTap,
                label: "Favoritos",
                isSelected: widget.currentPage == Pages.favorites,
              ),
              _buttonNavigation(
                icon: AppIcons.user,
                onTap: onUnavailableFeatureTap,
                label: "Conta",
                isSelected: widget.currentPage == Pages.account,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Expanded _buttonNavigation({
  required String icon,
  void Function()? onTap,
  bool isSelected = false,
  required String label,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Column(
            children: [
              icon.icon(
                color: isSelected ? AppColors.defaultCyan : Colors.grey,
                width: 32,
                height: 32,
              ),
              const Height(4),
              Text(
                style: TextStyle(
                  color: isSelected ? AppColors.defaultCyan : Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                label,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
