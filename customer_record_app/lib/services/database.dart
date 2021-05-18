import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_record_app/models/customer.dart';
import 'package:customer_record_app/models/user.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference customerCollection = Firestore.instance.collection('customers');

  Future <void> createCustomerRecord(String name, String email, String mobile, String appointments) async {
    return await customerCollection.document(uid).setData({
      'name' : name,
      'email': email,
      'mobile number': mobile,
      'appointments attended': appointments,

    });
  }

  // customer list from snapshot
  List<Customer> _custListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Customer(
        uid: doc.data['uid'] ?? '',
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        mobile: doc.data['mobile'] ?? '',
        appointments: doc.data['appointments'] ?? '3',
      );
      // convert from iterable to list
          }).toList();
  }

  //user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      mobile: snapshot.data['mobile'],
      appointments: snapshot.data['appointments'],
    );
  }

  // get customers stream

Stream<List<Customer>> get customers {
    return customerCollection.snapshots()
      .map(_custListFromSnapshot);
}

// get user doc stream

Stream<UserData> get userData {
    return customerCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
}

}