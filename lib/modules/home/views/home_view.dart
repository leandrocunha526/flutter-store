import 'package:corelab_app_challenge/core/domain/page_state.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:corelab_app_challenge/core/ui/components/bottom_navigation_bar.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:corelab_app_challenge/modules/home/components/app_bar_component.dart';
import 'package:corelab_app_challenge/modules/home/controllers/home_controller.dart';
import 'package:corelab_app_challenge/modules/shared/presentation/product_shimmer_skaleton.dart';
import 'package:corelab_app_challenge/modules/shared/presentation/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomePageState();
}

class HomePageState extends State<HomeView> {
  final controller = Modular.get<HomeController>()..fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const AppBarComponent(),
        bottomNavigationBar:
            const BottomNavigationBarComponent(currentPage: Pages.home),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(24),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Últimos anúncios",
                  style: AppTextStyles().larger,
                ),
              ),
              const Height(10),
              ValueListenableBuilder(
                  valueListenable: controller.pageState,
                  builder: (context, state, child) {
                    return state == PageState.success
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.productsList!.length,
                            itemBuilder: (context, index) {
                              final list = controller.productsList!;
                              final item = controller.productsList![index];
                              if (index == 0 ||
                                  list[index].dataAnuncio !=
                                      list[index - 1].dataAnuncio) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Height(10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        item.dataAnuncio,
                                        style: AppTextStyles(
                                                color: AppColors.tertiaryCyan)
                                            .small,
                                      ),
                                    ),
                                    const Height(10),
                                    const AppDivider(),
                                    ProductWidget(productEntity: item),
                                    const AppDivider()
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    ProductWidget(productEntity: item),
                                    const AppDivider()
                                  ],
                                );
                              }
                            },
                         )
                        : const ProductShimmerSkeletonWidget();
                  },
                ),
             ],
            ),
          ),
        ),
    );
  }
}
