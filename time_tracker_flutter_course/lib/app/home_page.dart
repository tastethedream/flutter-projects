
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/widgets/show_alert_dialog.dart';

class HomePage extends StatelessWidget {
//Method for signing out
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;


  Future<void> _signOut() async {
    try {
      await auth.signOut();
      print('user signed out');
    } catch (e) {
      print(e.toString());

    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
       context,
       title: 'Logout',
       content: 'Are you sure you wish to logout?',
       cancelActionText: 'Cancel',
       defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true ) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            child: Text('Logout',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),),
            onPressed: () => _confirmSignOut(context),
          )
        ],

      ),
    );
  }
}
