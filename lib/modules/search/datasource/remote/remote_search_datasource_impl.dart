import 'package:corelab_app_challenge/modules/home/data/datasources/data_source_home_impl.dart';
import 'package:corelab_app_challenge/modules/search/datasource/remote/remote_search_datasource.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/shared/data/models/product_model.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';

class RemoteSearchDatasourceImpl extends RemoteSearchDataSource {
  @override
  Future<List<ProductEntity>> search(String search,
      {SearchType? searchType}) async {
    final List<ProductEntity> productsFound = [];

    for (var productsMap in dataMock) {
      final products = ProductModel.fromJson(productsMap);
      if (searchType == SearchType.byCategory &&
          products.categoria.toLowerCase().contains(search.toLowerCase())) {
        productsFound.add(products);
      } else if (products.titulo
          .toLowerCase()
          .startsWith(search.toLowerCase())) {
        productsFound.add(products);
      }
    }

    await Future.delayed(const Duration(seconds: 2));

    return productsFound;
  }
}
