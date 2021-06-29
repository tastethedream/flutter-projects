import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/job_entries_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/edit_jobs_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/job_list_tile.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/list_items_builder.dart';
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
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  // Method to swipe to delete
  Future<void> _delete(BuildContext context, {Job job}) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation Failed',
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
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _confirmSignOut(context),
            )
          ],
        ),
        body: _buildContents(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
          onPressed: () => EditJobPage.show(context),
        ),
      );
    }

    Widget _buildContents(BuildContext context) {
      final database = Provider.of<Database>(context, listen: false);
      return StreamBuilder<List<Job>>(
        stream: database.jobsStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) =>
                Dismissible(
                  key: Key('job-${job.id}'),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _delete(context, job: job),
                  child: JobListTile(
                    job: job,
                    onTap: () => JobEntriesPage.show(context, job),
                  ),
                ),
          );
        },
      );
    }
  }