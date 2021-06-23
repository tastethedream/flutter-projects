import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/database.dart';
import 'package:time_tracker_flutter_course/widgets/show_alert_dialog.dart';

class JobsPage extends StatelessWidget {
//Method for signing out

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
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
      _signOut(context);
    }
  }

 // get access to the database
  Future<void> _createJob(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    //Create a job
    await database.createJob({
      'name': 'Blogging',
      'ratePerHour': 10,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createJob(context),
      ),
    );
  }

}
