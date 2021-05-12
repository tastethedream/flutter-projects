import 'package:flutter/material.dart';
import 'package:customer_record_app/models/customer.dart';
import 'package:flutter/painting.dart';

class CustomerTile extends StatelessWidget {

  final Customer customer;
  CustomerTile({this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.pink,
            backgroundImage: AssetImage('assets/head.png'),
          ),
          title: Text(customer.name),
          subtitle: Text(
              'contact ${customer.email} or ${customer.mobile}'),
          trailing: Text('Fulfilled ${customer.appointments} appointments'),
              ),
      ),
    );
  }
}
