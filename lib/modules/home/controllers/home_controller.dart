import 'package:corelab_app_challenge/core/domain/page_state.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecases.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HomeController {
  final FetchDataUseCases fetchDataUseCases;
  HomeController(this.fetchDataUseCases);

  ValueNotifier<PageState> pageState = ValueNotifier(PageState.initial);

  List<ProductEntity>? productsList;

  Future<void> fetchData() async {
    pageState.value = PageState.loading;
    final result = await fetchDataUseCases();

    result.fold((error) {
      pageState.value = PageState.error;
    }, (result) {
      pageState.value = PageState.success;
      productsList = result;
    });
  }
}
