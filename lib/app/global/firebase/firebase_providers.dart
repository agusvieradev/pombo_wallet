import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';
import 'package:pombo_wallet/app/features/user/domain/user_state.dart';

final Provider<GoogleSignIn> googleAuthProvider = Provider<GoogleSignIn>(
  (ProviderRef<GoogleSignIn> ref) {
    return GoogleSignIn();
  },
);

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>(
  (ProviderRef<FirebaseAuth> ref) {
    return FirebaseAuth.instance;
  },
);

final Provider<FirebaseFirestore> firestoreProvider =
    Provider<FirebaseFirestore>(
  (ProviderRef<FirebaseFirestore> ref) {
    return FirebaseFirestore.instance;
  },
);

final StreamProvider<User?> firebeaseUserStateProvider = StreamProvider<User?>(
  (StreamProviderRef<User?> ref) {
    return FirebaseAuth.instance.authStateChanges();
  },
);

final StreamProvider firestoreUserLoggedProvider = StreamProvider(
  (StreamProviderRef ref) {
    final UserState user = ref.watch(authServiceProvider);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.user!.uid)//! verififcar id con UserData
        .snapshots();
  },
);
