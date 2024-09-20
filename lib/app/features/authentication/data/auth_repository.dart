import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class AuthRepository {
  AuthRepository({
    required this.firebaseAuth,
    required this.googleAuth,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleAuth;

  Future<UserCredential> logIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential?> logInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleAuth.signInSilently();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleSignInCredentials =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInCredentials.accessToken,
        idToken: googleSignInCredentials.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> registerUser(String email, String password) async {
    final UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
    await googleAuth.signOut();
  }
}

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((ref) {
  final FirebaseAuth firebaseAuth = ref.watch(firebaseAuthProvider);
  final GoogleSignIn googleAuth = ref.watch(googleAuthProvider);
  return AuthRepository(firebaseAuth: firebaseAuth, googleAuth: googleAuth);
});
