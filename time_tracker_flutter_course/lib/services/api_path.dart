

class APIPath {
  //path to add new job
  static String job(String uid, String jobId) => '/users/$uid/jobs/$jobId';
  //path to all jobs created by a specific user
  static String jobs(String uid) => 'users/$uid/jobs';
}