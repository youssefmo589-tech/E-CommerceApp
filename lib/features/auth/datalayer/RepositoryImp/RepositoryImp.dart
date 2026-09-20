import 'package:ecommerce/features/auth/datalayer/FirebaseDataSource/FirebaseAuth.dart';
import 'package:ecommerce/features/auth/domain/repository/RepositoryInterface.dart';

class RepositoryImp extends RepositoryInterface {
  AuthService _authService;

  RepositoryImp({required this._authService});

  @override
  Future<bool> SignIn(String email, String password) async {
    try {
      final result = await _authService.signInwithAccount(email, password);

      if (result) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
