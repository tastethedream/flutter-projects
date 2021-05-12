import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_record_app/models/customer.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference customerCollection = Firestore.instance.collection('customers');

  Future createCustomerRecord(String name, String email, String mobile, int appointments) async {
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
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        mobile: doc.data['mobile'] ?? '',
        appointments: doc.data['appointments'] ?? 0,
      );
      // convert from iterable to list
          }).toList();
  }

  // get customers stream

Stream<List<Customer>> get customers {
    return customerCollection.snapshots()
      .map(_custListFromSnapshot);
}

}