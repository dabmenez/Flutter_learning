import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserProvider {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    final docRef = _usersCollection.doc(user.id);
    await docRef.set(user.toJson());
  }

  Future<UserModel?> getUser(String id) async {
    try {
      final doc = await _usersCollection.doc(id).get();
      if (doc.exists) {
        return UserModel.fromJson(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }
      return null;
    } catch (e) {
      print('Erro ao buscar usuário: $e');
      return null;
    }
  }
}
