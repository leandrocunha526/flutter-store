import 'package:corelab_app_challenge/core/routes/routes.dart';
import 'package:corelab_app_challenge/modules/home/controllers/home_controller.dart';
import 'package:corelab_app_challenge/modules/home/data/datasources/data_source_home.dart';
import 'package:corelab_app_challenge/modules/home/data/datasources/data_source_home_impl.dart';
import 'package:corelab_app_challenge/modules/home/data/repository/repository_home_impl.dart';
import 'package:corelab_app_challenge/modules/home/data/repository/repository_home.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecases.dart';
import 'package:corelab_app_challenge/modules/home/views/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<HomeController>(
      (i) => HomeController(
        i.get<FetchDataUseCases>(),
      ),
    ),
    Bind.factory<DataSourceHome>(
      (i) => HomeDataSourceImpl(),
    ),
    Bind.factory<RepositoryHome>(
      (i) => RepositoryHomeImpl(
        i.get<DataSourceHome>(),
      ),
    ),
    Bind.factory<FetchDataUseCases>(
      (i) => FetchDataUseCasesImpl(
        i.get<RepositoryHome>(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.home, child: ((context, args) => const HomeView())),
  ];
}
