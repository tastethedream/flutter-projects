import 'package:customer_record_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  //key for form validation
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          elevation: 0.0,
          title: Text('Sign up to Brat Lash'),
          actions: [
        FlatButton.icon(
        icon: Icon(Icons.person, color: Colors.white,),
      label: Text('Sign In', style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
          widget.toggleView();
      },
    )
    ]
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) => val.isEmpty ? 'Please enter your name' : null,
                        onChanged: (val) {
                          setState(() => name = val);

                        }
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) => val.isEmpty ? 'Please enter your email' : null,
                        onChanged: (val) {
                          setState(() => email = val);

                        }
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.length < 6 ? 'Please enter a password with 6 or more chars ' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 220.0),
                    RaisedButton(
                        color: Colors.pink[300],
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.regEmailPassword(email, password, name);
                            if(result == null) {
                              setState(() => error = 'Please provide correct details to register');

                              }
                            }
                          }

                    )

                  ],
                ),
              )
          ),
        ),

    );
  }
}
