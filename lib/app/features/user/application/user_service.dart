import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  Stream<Map<String, dynamic>> getUserDataStream(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((userDoc) {
      if (userDoc.exists) {
        final Map<String, dynamic> userData = userDoc.data()!;
        userData['uid'] = userId;

        return userData;
      } else {
        throw Exception("No se encontraron datos del usuario en Firestore");
      }
    });
  }
}

final Provider<UserService> userServiceProvider = Provider<UserService>(
  (ref) => UserService(),
);
