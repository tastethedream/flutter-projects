import 'package:flutter/material.dart';
import 'package:customer_record_app/models/customer.dart';
import 'package:customer_record_app/screens/customer/edit_form.dart';


class CustomerTile extends StatelessWidget {

  final Customer customer;
  CustomerTile({this.customer});

  @override
  Widget build(BuildContext context) {

    void _showEditPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: EditForm(),
        );
      });
    }
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(customer.name),
            subtitle: Text('Had ${customer.appointments} appointments'),
            dense: true,
            trailing: Text(customer.email),
            onTap: () => _showEditPanel(),
          ),
        )
    );
  }
}