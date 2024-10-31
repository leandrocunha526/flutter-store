import 'package:corelab_app_challenge/core/domain/page_state.dart';
import 'package:corelab_app_challenge/core/utils/debounce.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/fetch_history_usecase.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/save_to_history_usecase.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/search_usecase.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class SearchModuleController {
  final SaveToHistoryUsecase saveToHistoryUsecase;
  final SearchUsecase searchUsecase;
  final FetchHistoryUsecase fetchHistoryUsecase;
  SearchModuleController(
    this.saveToHistoryUsecase,
    this.searchUsecase,
    this.fetchHistoryUsecase,
  );
  ValueNotifier<List<ProductEntity>> searchResults = ValueNotifier([]);
  ValueNotifier<List<String>> searchHistory = ValueNotifier([]);
  final Debounce searchDebounce = Debounce(const Duration(seconds: 1));
  final ValueNotifier<PageState> statePage = ValueNotifier(PageState.initial);
  final TextEditingController searchTextEditingController =
      TextEditingController();

  Future<void> fetchHistory() async {
    statePage.value = PageState.loading;
    final response = await fetchHistoryUsecase();
    response.fold((error) {
      debugPrint(error.message);
    }, (response) {
      statePage.value = PageState.initial;
      searchHistory.value = [...response];
      //print(searchHistory.value[0]); // Development moment and not use in production.
    });
  }

  Future<void> saveToHistory(String search) async {
    await saveToHistoryUsecase(search);
    await fetchHistory();
  }

  Future<void> search(String search, {SearchType? searchType}) async {
    searchDebounce.cancel();
    searchDebounce.run(() async {
      if (searchType != SearchType.byCategory &&
          (searchTextEditingController.text == '' || search == '')) {
        return;
      }
      searchTextEditingController.text = search;
      statePage.value = PageState.loading;

      saveToHistory(search);

      final response = await searchUsecase(search, searchType: searchType);
      response.fold((error) {
        statePage.value = PageState.error;
      }, (response) {
        statePage.value = PageState.success;
        searchResults.value = [...response];
      });
    });
  }

  Future<void> onHistoryClick(String search) async {
    searchTextEditingController.text = search;

    this.search(search);
  }

  void undoSearch() async {
    searchTextEditingController.clear();
    searchResults.value = [];
    await fetchHistory();
    statePage.value = PageState.initial;
  }
}
