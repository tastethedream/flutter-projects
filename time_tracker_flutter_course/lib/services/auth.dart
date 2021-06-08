import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Define a public interface to support all the authentication methods needed for the project
abstract class AuthBase {
  User get currentUser;
  Stream<User> authStateChanges();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase{
  // Make firebaseAuth.instance into a variable to use throughout
  final _firebaseAuth = FirebaseAuth.instance;

  // getting access to the stream
  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();


  // Current User
  @override
  User get currentUser => _firebaseAuth.currentUser;

  //method to sign in anonymously
  @override
  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  // method to sign in with Google
  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            message: 'Missing Google ID token',
            code: 'MISSING_GOOGLE_ID_TOKEN',
        );
      }
    } else {
      throw FirebaseAuthException(
          message: 'Sign in aborted by user',
          code: 'ERROR_ABORTED_BY_USER',
      );
    }
  }
  // method to sign in with Facebook

 // method to sign out of firebase and Google
  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}