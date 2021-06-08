
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomePage extends StatelessWidget {
//Method for signing out
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;


  Future<void> _signOut() async {
    try {
      await auth.signOut();
      print('user signed out');
    } catch (e) {
      print(e.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            child: Text('Logout',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),),
            onPressed: _signOut,
          )
        ],

      ),
    );
  }
}
