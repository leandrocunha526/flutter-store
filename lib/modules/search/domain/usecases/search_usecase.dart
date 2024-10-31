import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchUsecase {
  Future<Either<ErrorMessage, List<ProductEntity>>> call(
    String search, {
    SearchType? searchType,
  });
}

class SearchUsecaseImpl extends SearchUsecase {
  final SearchRepository searchRepository;

  SearchUsecaseImpl(this.searchRepository);
  @override
  Future<Either<ErrorMessage, List<ProductEntity>>> call(String search,
      {SearchType? searchType}) async {
    return await searchRepository.search(search, searchType: searchType);
  }
}
