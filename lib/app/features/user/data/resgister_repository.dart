import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class UserRegisterRepository {
  UserRegisterRepository({
    required this.firebaseAuth,
    required this.firestore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  Future<User?> registerUser(String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e, trace) {
      log('Error: $e, stk: $trace');
      throw Exception('Error: $e, stk: $trace');
    }
  }

  Future<void> saveUserData({
    required String userId,
    required String name,
    required String adress,
    required String phone,
    required String email,
  }) async {
    try {
      final CollectionReference<Map<String, dynamic>> usersCollection =
          FirebaseFirestore.instance.collection('users');

      await usersCollection.doc(userId).set({
        'name': name,
        'email': email,
        'phone': phone,
        'adress': adress,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e, trace) {
      log('Error: $e, stk: $trace');
      throw Exception('Error: $e, stk: $trace');
    }
  }
}

final Provider<UserRegisterRepository> userRegisterRepositoryProvider =
    Provider<UserRegisterRepository>(
  (ProviderRef<UserRegisterRepository> ref) {
    final FirebaseAuth firebaseAuth = ref.watch(firebaseAuthProvider);
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    return UserRegisterRepository(
        firebaseAuth: firebaseAuth, firestore: firestore);
  },
);
