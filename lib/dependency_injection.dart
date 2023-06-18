import 'package:get_it/get_it.dart';

import 'core/data/datasource/product_datasource.dart';
import 'core/data/repository/product_repository.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // register datasources
  await _registerDatasource();

  // register repositories
  _registerRepositories();

  // register viewModels
  _registerViewModels();

  ///others
  _registerOthers();
}

_registerOthers() async {}

// View models
void _registerViewModels() {}

// Repositories
void _registerRepositories() {
  getIt.registerFactory<ProductRepository>(
    () => ProductRepository(localDataSource: getIt(), apiDataSource: getIt()),
  );
}

// data sources
Future<void> _registerDatasource() async {
  getIt
    ..registerFactory<LocalProductDataSource>(
      () => LocalProductDataSource(),
    )
    ..registerFactory<ApiProductDataSource>(
      () => ApiProductDataSource(),
    );
}
