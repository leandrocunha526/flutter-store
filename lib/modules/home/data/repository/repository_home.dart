import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RepositoryHome {
  Future<Either<ErrorMessage, List<ProductEntity>>> fetchData();
}
