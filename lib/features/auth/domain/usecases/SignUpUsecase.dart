import '../../presentation/Models/UserModel.dart';
import '../repository/RepositoryInterface.dart';

class SignUpUsecase {
  RepositoryInterface _repositoryinterface;

  SignUpUsecase({required this._repositoryinterface});

  Future<bool> call(UserModel user) async {
    return await _repositoryinterface.SignUp(user);
  }
}
