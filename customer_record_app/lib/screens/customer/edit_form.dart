import 'package:flutter/material.dart';
import 'package:customer_record_app/shared/constants.dart';

class EditForm extends StatefulWidget {


  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> appointments = ['0', '1', '2', '3', '4', '5'];

// form values

  String _currentName;
  String _currentEmail;
  String _currentMobile;
  String _currentAppointments;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Wrap(
        children: [
          Text(
            'Edit a customer record',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Enter customer name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentAppointments ?? '0',
            items: appointments.map((appointment) {
              return DropdownMenuItem(
                value: appointment,
                child: Text('$appointment appointments'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentAppointments = val),
          ),
          //textformfield
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Enter customer Email' : null,
            onChanged: (val) => setState(() => _currentEmail = val),
          ),
          SizedBox(height: 20.0),
          //textformfield
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Enter customer mobile' : null,
            onChanged: (val) => setState(() => _currentMobile = val),
          ),
          SizedBox(height: 20.0),
          //button
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentAppointments);
                print(_currentEmail);
                print(_currentMobile);
              }

          ),


        ],
      ),
    );
  }
}