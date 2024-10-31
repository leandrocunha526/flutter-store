import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class FetchHistoryUsecase {
  Future<Either<ErrorMessage, List<String>>> call();
}

class FetchHistoryUsecaseImpl extends FetchHistoryUsecase {
  final SearchRepository searchRepository;

  FetchHistoryUsecaseImpl(this.searchRepository);
  @override
  Future<Either<ErrorMessage, List<String>>> call() async {
    return await searchRepository.fetchHistory();
  }
}
