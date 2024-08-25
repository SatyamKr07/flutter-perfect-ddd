// lib/infrastructure/datasources/firebase/firebase_user_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/models/user/user_model.dart';

@lazySingleton
class FirebaseUserDatasource {
  final FirebaseFirestore _firestore;

  FirebaseUserDatasource(this._firestore);

  Future<UserModel> updateUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toJson());
    return user;
  }

  Future<UserModel?> getUserById(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    }

    return null;
  }

  Future<UserModel> createUser(UserModel userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toJson()); // Save the new user to Firestore
    return userModel; // Return the newly created user
  }
}
