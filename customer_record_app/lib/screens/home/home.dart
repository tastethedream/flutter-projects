import 'package:customer_record_app/screens/customer/newCustomer.dart';
import 'package:customer_record_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:customer_record_app/models/user.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          // todo add user name dynamically on sign in
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton.icon(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.pink[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular (50.0)
                    ),

                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNewCustomer())
                  );
                },
                    icon: Icon(
                      Icons.face_rounded, color: Colors.white,
                ),

                      label: Text(
                        'Add a new Customer',
                      style: TextStyle(color: Colors.white),
                ),
                  ),
                  SizedBox(height: 30.0),
                  RaisedButton.icon(
                    color: Colors.pink[300],
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular (50.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddNewCustomer())
                      );
                    },
                    icon: Icon(
                      Icons.create_rounded, color: Colors.white,
                    ),

                    label: Text(
                      'Edit Customer Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  RaisedButton.icon(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.pink[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular (50.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddNewCustomer())
                      );
                    },
                    icon: Icon(
                      Icons.favorite_rounded, color: Colors.white,
                    ),

                    label: Text(
                      'Loyalty Scheme',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                ],
          ),









        ),
      ),
    );
  }
}
