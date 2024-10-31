import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';

abstract class RemoteSearchDataSource {
  Future<List<ProductEntity>> search(String search, {SearchType? searchType});
}
