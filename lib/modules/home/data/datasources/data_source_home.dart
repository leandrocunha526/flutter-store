import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';

abstract class DataSourceHome {
  Future<List<ProductEntity>> fetchData();
}
