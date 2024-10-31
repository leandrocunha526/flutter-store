import 'package:corelab_app_challenge/core/routes/routes.dart';
import 'package:corelab_app_challenge/modules/search/controllers/search_module_controller.dart';
import 'package:corelab_app_challenge/modules/search/datasource/local/local_search_datasource.dart';
import 'package:corelab_app_challenge/modules/search/datasource/local/local_search_datasource_impl.dart';
import 'package:corelab_app_challenge/modules/search/datasource/remote/remote_search_datasource.dart';
import 'package:corelab_app_challenge/modules/search/datasource/remote/remote_search_datasource_impl.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/fetch_history_usecase.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/save_to_history_usecase.dart';
import 'package:corelab_app_challenge/modules/search/domain/usecases/search_usecase.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository.dart';
import 'package:corelab_app_challenge/modules/search/repository/search_repository_impl.dart';
import 'package:corelab_app_challenge/modules/search/views/search_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<SearchModuleController>(
      (i) => SearchModuleController(
        i.get<SaveToHistoryUsecase>(),
        i.get<SearchUsecase>(),
        i.get<FetchHistoryUsecase>(),
      ),
    ),
    Bind.factory<LocalSearchDataSource>(
      (i) => LocalSearchDatasourceImpl(),
    ),
    Bind.factory<RemoteSearchDataSource>(
      (i) => RemoteSearchDatasourceImpl(),
    ),
    Bind.factory<FetchHistoryUsecase>(
      (i) => FetchHistoryUsecaseImpl(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SaveToHistoryUsecase>(
      (i) => SaveToHistoryUsecaseImpl(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SearchUsecase>(
      (i) => SearchUsecaseImpl(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SearchRepository>((i) => SearchRepositoryImpl(
        i.get<LocalSearchDataSource>(), i.get<RemoteSearchDataSource>()))
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.search,
        child: ((context, args) => SearchView(categoryToSearch: args.data))),
  ];
}
