import 'package:ecommerce/features/auth/datalayer/FirebaseDataSource/FirebaseAuth.dart';
import 'package:ecommerce/features/auth/domain/repository/RepositoryInterface.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/Models/UserModel.dart';
import '../FirebaseDataSource/FireStoreService.dart';

class RepositoryImp extends RepositoryInterface {
  AuthService _authService;

  FireStoreService _fireStoreService;

  RepositoryImp({required this._authService, required this._fireStoreService});

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

  @override
  Future<bool> SignUp(UserModel user) async {
    try {
      final result = await _authService.createAccount(
          user.email, user.password);

      if (result) {
        final uid = FirebaseAuth.instance.currentUser!.uid;
        user.userid = uid;
        final res = await _fireStoreService.createUser(user);
        if (res) {
          return true;
        }
        else {
          return false;
        }
      }
      else {
        return false;
      }
    } catch (error) {
      return false;
    }

    
  }
}
