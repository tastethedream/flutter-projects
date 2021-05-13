import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_record_app/models/customer.dart';
import 'package:customer_record_app/services/auth.dart';
import 'package:customer_record_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AmendCustomer extends StatefulWidget {

  @override
  _AmendCustomerState createState() => _AmendCustomerState();
}

class _AmendCustomerState extends State<AmendCustomer> {

  var selectedCustomer, selectedType;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Customer>>.value(
      value: DatabaseService().customers,
      child: Scaffold(
          backgroundColor: Colors.pink[50],
          appBar: AppBar(
            title: Text('Amend your customer details'),
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
          body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('customers').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData)
                return Center(
                  child: const Text('Loading......'),
                );
              else {
                List<DropdownMenuItem> nameList = [];
                for(int i=0;i<snapshot.data.documents.length; i++) {
                    DocumentSnapshot snap = snapshot.data.documents[i];
                    nameList.add(
                     DropdownMenuItem(
                      child: Text(
                      snap.data['name'],

              ),
              value: '${snap.data['name']}',
      ),
      );
      }
              //return Container(
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 50.0, color: Colors.white, ),
              SizedBox(width: 50.0),
              DropdownButton(
                items: nameList,
                onChanged: (customerValue) {
                  final snackbar = SnackBar(
                    content: Text(
                      'You have selected $customerValue',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackbar);
                  setState(() {
                    selectedCustomer = customerValue;
                  });
                },
                value: selectedCustomer,
                isExpanded: false,
                hint: Text('Select Customer to edit'),
                        )
                      ],

                    );
                  }
                },
              ),
    )

          );





  }
}
