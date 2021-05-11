import 'package:customer_record_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Brat Lash'),
        backgroundColor: Colors.pink[300],
        elevation: 0.0,
        actions: [
          FlatButton.icon(onPressed: () async {
            await _auth.signOut();
          },
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout', style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
