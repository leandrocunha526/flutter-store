import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/search/domain/search_types_enum.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<ErrorMessage, List<ProductEntity>>> search(
    String search, {
    SearchType? searchType,
  });
  Future<Either<ErrorMessage, List<String>>> fetchHistory();
  Future<Either<ErrorMessage, Unit>> saveToHistory(String search);
}
