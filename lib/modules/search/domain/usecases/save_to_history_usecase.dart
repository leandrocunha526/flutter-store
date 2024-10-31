import 'package:corelab_app_challenge/core/errors/error_message.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SaveToHistoryUsecase {
  Future<Either<ErrorMessage, Unit>> call(String search);
}

class SaveToHistoryUsecaseImpl extends SaveToHistoryUsecase {
  final SearchRepository searchRepository;

  SaveToHistoryUsecaseImpl(this.searchRepository);
  @override
  Future<Either<ErrorMessage, Unit>> call(String search) async {
    return await searchRepository.saveToHistory(search);
  }
}
