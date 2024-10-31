import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/search/datasource/local/local_search_datasource.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../datasource/remote/remote_search_datasource.dart';

class SearchRepositoryImpl extends SearchRepository {
  final LocalSearchDataSource localSearchDataSource;

  final RemoteSearchDataSource remoteSearchDataSource;

  SearchRepositoryImpl(this.localSearchDataSource, this.remoteSearchDataSource);

  @override
  Future<Either<ErrorMessage, List<String>>> fetchHistory() async {
    try {
      var response = await localSearchDataSource.fetchHistory();
      return Right(response);
    } on ErrorMessage catch (_) {
      return Left(ErrorMessage());
    } on Exception {
      return Left(ErrorMessage());
    }
  }

  @override
  Future<Either<ErrorMessage, Unit>> saveToHistory(String search) async {
    try {
      await localSearchDataSource.saveHistory(search);
      return const Right(unit);
    } on ErrorMessage catch (_) {
      return Left(ErrorMessage());
    } on Exception {
      return Left(ErrorMessage());
    }
  }

  @override
  Future<Either<ErrorMessage, List<ProductEntity>>> search(String search,
      {SearchType? searchType}) async {
    try {
      final response =
          await remoteSearchDataSource.search(search, searchType: searchType);
      return Right(response);
    } on ErrorMessage catch (_) {
      return Left(ErrorMessage());
    } on Exception {
      return Left(ErrorMessage());
    }
  }
}
