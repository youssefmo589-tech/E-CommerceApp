import 'package:ecommerce/features/layoutView/datalayer/dataSource/getProducts.dart';
import 'package:ecommerce/features/layoutView/domain/Repository/RepositoryInterface.dart';
import 'package:ecommerce/features/layoutView/domain/UseCases/getAllCategoriesUsecase.dart';
import 'package:get_it/get_it.dart';

import '../datalayer/RepositoryImp/repositoryImp.dart';
import '../domain/UseCases/getAllProductsUsecase.dart';

final getit = GetIt.instance;

void DIlayout() {
  getit.registerLazySingleton<getProducts>(() => getProducts());

  getit.registerLazySingleton<RepositoryLayoutInterface>(() =>
      RepositoryImpLayout(getit<getProducts>()));

  getit.registerLazySingleton<GetAllProductsUsecase>(() =>
      GetAllProductsUsecase(getit<RepositoryLayoutInterface>()));

  getit.registerLazySingleton<GetAllCategoriesUsecase>(() =>
      GetAllCategoriesUsecase(getit<RepositoryLayoutInterface>()));
}

