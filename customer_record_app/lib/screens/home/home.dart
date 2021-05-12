import 'package:customer_record_app/screens/customer/newCustomer.dart';
import 'package:customer_record_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.pink[300],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout', style: TextStyle(color: Colors.white),),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: RaisedButton.icon(
          color: Colors.pink[300],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewCustomer())
            );
          },
          icon: Icon(
            Icons.add, color: Colors.white,
          ),

          label: Text(
            'Add a new Customer',
            style: TextStyle(color: Colors.white),
          ),
        ),




      ),
    );
  }
}
