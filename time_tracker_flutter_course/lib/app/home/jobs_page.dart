import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/database.dart';
import 'package:time_tracker_flutter_course/widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/widgets/show_exception_alert_dialog.dart';

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

 // get access to the database and handle errors
  Future<void> _createJob(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      //Create a job
      await database.createJob(Job(name: 'Blogging', ratePerHour: 10));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Problem with database',
        exception: e,
      );

    }
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
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
        onPressed: () => _createJob(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
        stream: database.jobsStream(),
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            final jobs = snapshot.data;
            final children = jobs.map((job) => Text(job.name)).toList();
            return ListView(children: children);

          }
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }
          return Center(child: CircularProgressIndicator());
        });

  }

}
