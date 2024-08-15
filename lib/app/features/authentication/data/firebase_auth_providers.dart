import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
