import 'package:ecommerce/features/auth/domain/repository/RepositoryInterface.dart';

class SignInUsecase {
  RepositoryInterface _repositoryInterface;

  SignInUsecase({required this._repositoryInterface});

  Future<bool> call(String email, String password) async {
    return await _repositoryInterface.SignIn(email, password);
  }
}
