import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/Models/UserModel.dart';

class FireStoreService {
  static CollectionReference<UserModel> getcollectionref() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionname)
        .withConverter(
          fromFirestore: (snapshot, option) =>
              UserModel.fromjson(snapshot.data()!),

          toFirestore: (data, option) => data.tojson(),
        );
  }

  Future<bool> createUser(UserModel user) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(user.userid);

      await docRef.set(user);

      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<UserModel?> getUser(String? userid) async {
    try {
      final collectionref = getcollectionref();
      final user = await collectionref.doc(userid).get();

      if (user.exists) {
        return user.data();
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  static Future<bool> deleteuser(String userId) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(userId);
      await docRef.delete();

      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> update(UserModel user) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(user.userid);
      await docRef.update(user.tojson());

      return true;
    } catch (error) {
      return false;
    }
  }
}
