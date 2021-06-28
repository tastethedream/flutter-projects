import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_tracker_flutter_course/widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/widgets/show_exception_alert_dialog.dart';

class AddJobPage extends StatefulWidget {
// Allow this widget access to the database
  const AddJobPage({Key key, @ required this.database}) : super(key: key);
  final Database database;


  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context ) => AddJobPage(database: database),
      fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  // create form key
  final _formKey = GlobalKey<FormState>();

  //focus nodes
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _rateFocusNode = FocusNode();

  String _name;
  int _ratePerHour;

  //use key to access the form
  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // validate and submit form
  // submit data to firestore
  // manage errors
  Future<void> _submit() async {
     if(_validateAndSaveForm()) {
       try {
         // get the current list of jobs from firestore
      final jobs = await widget.database.jobsStream().first;
      // get all the job names inside the list
      final allNames = jobs.map((job) => job.name).toList();
      // ensure all job names are unique(not duplicated)
      if (allNames.contains(_name)) {
        showAlertDialog(
            context,
            title: 'Duplicate Name',
            content: 'Please select and alternative job name',
            defaultActionText: 'Ok',
        );
      } else {
        final job = Job(name: _name, ratePerHour: _ratePerHour);
        await widget.database.createJob(job);
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e){
         showExceptionAlertDialog(
             context,
             title: 'Problem with adding new job',
             exception: e,
         );

       }
       }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('New Job'),
        actions: [
          FlatButton(
              onPressed: _submit,
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                ),
              ),
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
            ),

          ),
        ),

    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),

    );
  }

  List<Widget>_buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Job Name'),
        focusNode: _nameFocusNode,
        validator: (value) => value.isNotEmpty ? null : 'Name field cannot be empty',
        onSaved: (value) => _name = value,

      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Rate Per Hour'),
        focusNode: _rateFocusNode,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _ratePerHour = int.tryParse(value)?? 0,

      ),
    ];
  }
}
