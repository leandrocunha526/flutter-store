import 'package:corelab_app_challenge/core/domain/page_state.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:corelab_app_challenge/modules/search/components/custom_search_bar_component.dart';
import 'package:corelab_app_challenge/modules/search/components/item_search_component.dart';
import 'package:corelab_app_challenge/modules/search/components/no_results_component.dart';
import 'package:corelab_app_challenge/modules/search/controllers/search_module_controller.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/shared/presentation/product_shimmer_skaleton.dart';
import 'package:corelab_app_challenge/modules/shared/presentation/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchView extends StatefulWidget {
  final String? categoryToSearch;

  const SearchView({
    super.key,
    this.categoryToSearch,
  });
  @override
  State<StatefulWidget> createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final controller = Modular.get<SearchModuleController>()..fetchHistory();

  @override
  void initState() {
    if (widget.categoryToSearch != null) {
      controller.search(widget.categoryToSearch!,
          searchType: SearchType.byCategory);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchBarComponent(controller: controller),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(24),
              ValueListenableBuilder(
                valueListenable: controller.statePage,
                builder: (context, state, child) {
                  if (state == PageState.initial &&
                      controller.searchTextEditingController.text.isEmpty &&
                      controller.searchHistory.value.isNotEmpty) {
                    return ValueListenableBuilder(
                      valueListenable: controller.searchHistory,
                      builder: (context, searchHistory, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Pesquisas recentes",
                                  style: AppTextStyles().medium),
                            ),
                            const Height(6),
                            ...searchHistory.map(
                              (element) => ItemSearchComponent(
                                name: element,
                                onTap: () => controller.onHistoryClick(element),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state == PageState.success &&
                      controller.searchResults.value.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            " ${controller.searchResults.value.length} resultados encontrados",
                            style: AppTextStyles().medium,
                          ),
                        ),
                        const Height(6),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searchResults.value.length,
                          itemBuilder: (context, index) {
                            final item = controller.searchResults.value[index];
                            return Column(
                              children: [
                                const AppDivider(),
                                ProductWidget(productEntity: item),
                                if (index + 1 ==
                                    controller.searchResults.value.length)
                                  const Divider()
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state == PageState.success &&
                      controller.searchResults.value.isEmpty) {
                    return NoResultsComponent(
                        search: controller.searchTextEditingController.text);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Buscando...",
                              style: AppTextStyles().medium),
                        ),
                        const Height(6),
                        const ProductShimmerSkeletonWidget(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
