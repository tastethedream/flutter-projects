import 'package:firebase_auth/firebase_auth.dart';

//Define a public interface to support all the authentication methods needed for the project
abstract class AuthBase {
  User get currentUser;
  Stream<User> authStateChanges();
  Future<User> signInAnonymously();
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
  // method to sign in with Facebook

 // method to sign out
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}