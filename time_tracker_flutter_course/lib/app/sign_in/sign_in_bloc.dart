import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

// create class
class SignInBloc {
  SignInBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

//close the controller when the sign in page is removed from the widget tree
  void dispose() {
    _isLoadingController.close();
  }

  // method to add values to the stream
  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);


  // Method to handle the different sign in methods
  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try{
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;

    }
  }
  Future<User> signInAnonymously() async => _signIn(auth.signInAnonymously);
  Future<User> signInWithGoogle() async => _signIn(auth.signInWithGoogle);
  Future<User> signInWithFacebook() async => _signIn(auth.signInWithFacebook);


}