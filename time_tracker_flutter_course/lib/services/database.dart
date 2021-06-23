import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class Database {
  Future<void> createJob(Map<String, dynamic> jobData);

}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> createJob(Map<String, dynamic> jobData) async {
    //create a path that contains the location where we are going to write our firestore data to
    final path = '/users/$uid/jobs/job_abc';
    // Retrieve the document reference by accessing FirebaseFirestore.instance
    final documentReference =  FirebaseFirestore.instance.doc(path);
    // Write the data to the location pointed to by the document reference
    await documentReference.set(jobData);
  }
}