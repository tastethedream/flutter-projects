import 'package:customer_record_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  String name = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          elevation: 0.0,
          title: Text('Sign up to Brat Lash'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                        onChanged: (val) {
                          setState(() => name = val);

                        }
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);

                        }
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
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
                          print(name);
                          print(email);
                          print(password);
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
