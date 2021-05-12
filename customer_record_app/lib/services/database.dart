import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference customerCollection = Firestore.instance.collection('customers');

  Future createCustomerRecord(String name, String email, String mobileNumber) async {
    return await customerCollection.document(uid).setData({
      'name' : name,
      'email': email,
      'mobile number': mobileNumber,

    });
  }

}