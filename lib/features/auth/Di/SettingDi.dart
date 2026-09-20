import 'package:ecommerce/features/auth/datalayer/RepositoryImp/RepositoryIMP.dart';
import 'package:ecommerce/features/auth/domain/repository/RepositoryInterface.dart';
import 'package:ecommerce/features/auth/domain/usecases/signin-usecase.dart';
import 'package:get_it/get_it.dart';

import '../datalayer/FirebaseDataSource/FirebaseAuth.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerLazySingleton<AuthService>(() => AuthService());

  getit.registerLazySingleton<RepositoryInterface>(
    () => RepositoryImp(authService: getit<AuthService>()),
  );

  getit.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repositoryInterface: getit<RepositoryInterface>()),
  );
}
