import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/home/data/repository/repository_home.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FetchDataUseCases {
  Future<Either<ErrorMessage, List<ProductEntity>>> call();
}

class FetchDataUseCasesImpl implements FetchDataUseCases {
  final RepositoryHome repositoryHome;

  FetchDataUseCasesImpl(this.repositoryHome);

  @override
  Future<Either<ErrorMessage, List<ProductEntity>>> call() async {
    return await repositoryHome.fetchData();
  }
}
