import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class UserDataRepository {
  const UserDataRepository({required this.firestore});
  final FirebaseFirestore firestore;

  Future<void> updateUserData(
    String userId,
    Map<String, dynamic> updatedData,
  ) async {
    final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
    await userDoc.update(updatedData);
  }
}

final Provider<UserDataRepository> userDataRepositoryProvider =
    Provider<UserDataRepository>(
  (ref) {
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    return UserDataRepository(firestore: firestore);
  },
);
