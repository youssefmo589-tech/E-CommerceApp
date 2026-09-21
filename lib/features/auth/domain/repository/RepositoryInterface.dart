import '../../presentation/Models/UserModel.dart';

abstract class RepositoryInterface {
  Future<bool> SignIn(String email, String password);

  Future<bool> SignUp(UserModel user);
}
