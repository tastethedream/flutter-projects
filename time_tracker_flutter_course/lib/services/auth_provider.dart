import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({@required this.auth});
  final AuthBase auth;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}