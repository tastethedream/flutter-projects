import 'package:flutter/foundation.dart';

class Job {
  Job({@required this.name, @required this.ratePerHour});
  final String name;
  final int ratePerHour;

  //method to convert objects name and raterPerHour into a map of key value pairs
  // and write a job to Firestore

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'ratePerHour': ratePerHour,
    };
  }
}