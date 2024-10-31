import 'package:corelab_app_challenge/modules/categories/views/categories_view.dart';
import 'package:corelab_app_challenge/modules/categories/controllers/categories_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/routes/routes.dart';

class CategoriesModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.categories,
      child: ((context, args) => const CategoriesView()),
    ),
  ];

  @override
  final List<Bind> binds = [
    Bind.factory<CategoriesController>((i) => CategoriesController()),
  ];
}
