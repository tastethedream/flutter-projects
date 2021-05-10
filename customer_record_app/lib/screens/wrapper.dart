import 'package:customer_record_app/screens/authenticate/authenticate.dart';
import 'package:customer_record_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either home or authenticate screen depending if the user is logged in or not
    return Authenticate();
  }
}
