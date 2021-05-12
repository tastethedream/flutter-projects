import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_record_app/screens/customer/customer_list.dart';
import 'package:customer_record_app/screens/customer/newCustomer.dart';
import 'package:customer_record_app/services/auth.dart';
import 'package:customer_record_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:customer_record_app/models/user.dart';
import 'package:provider/provider.dart';


class CustomerScreen extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().customers,
      child: Scaffold(
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
        body: CustomerList()
        ),
      );

  }
}
