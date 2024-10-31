import 'package:corelab_app_challenge/core/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesController {
  void searchCategory(String categoryName){
    Modular.to.pushNamed(Routes.search, arguments: categoryName);
  }
}
