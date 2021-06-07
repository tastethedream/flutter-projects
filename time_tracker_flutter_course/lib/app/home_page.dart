import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
//Method for signing out
  const HomePage({Key key, @ required this.onSignOut}) : super(key: key);
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _signOut();
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
