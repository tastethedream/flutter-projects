import 'package:customer_record_app/services/auth.dart';
import 'package:customer_record_app/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

  class _SignInState extends State<SignIn> {

   final AuthService _auth = AuthService();
   final _formKey = GlobalKey<FormState>();

   // text field state
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
        title: Text('Sign in to My App'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Register', style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
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
                  decoration: textInputDecoration.copyWith(hintText:  'Email'),
                  validator: (val) => val.isEmpty ? 'Please enter your email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                    }
                    ),

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText:  'Password'),
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
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() =>
                          error = 'Incorrect credentials');
                        }
                      }
                    }

                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0 ),
            )

              ],
            ),
          )
        ),
      ),
    );
  }
}
