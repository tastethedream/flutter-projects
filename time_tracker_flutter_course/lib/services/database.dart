import 'package:meta/meta.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/api_path.dart';
import 'package:time_tracker_flutter_course/services/firestore_service.dart';

abstract class Database {
  Future<void> setJob(Job job);
  Stream<List<Job>> jobsStream();
  Future<void> deleteJob(Job job);
}

//variable for job ID and make the current date and time the job ID
  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();


class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  // method to create and update jobs
  @override
  Future<void> setJob(Job job) => _service.setData(
    path: APIPath.job(uid, job.id),
    data: job.toMap(),
  );

  // method to delete jobs
  @override
  Future<void> deleteJob(Job job) => _service.deleteData(
      path: APIPath.job(uid, job.id),
  );


  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream(
    path: APIPath.jobs(uid),
    builder: (data, documentId) => Job.fromMap(data, documentId),
  );

}
