import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/home/data/datasources/data_source_home.dart';
import 'package:corelab_app_challenge/modules/home/data/repository/repository_home.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class RepositoryHomeImpl implements RepositoryHome {
  final DataSourceHome _homeSourceData;

  RepositoryHomeImpl(this._homeSourceData);

  @override
  Future<Either<ErrorMessage, List<ProductEntity>>> fetchData() async {
    try {
      var response = await _homeSourceData.fetchData();
      return Right(response);
    } on ErrorMessage catch (_) {
      return Left(ErrorMessage());
    } on Exception {
      return Left(ErrorMessage());
    }
  }
}
