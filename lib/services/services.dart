import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:doctor/models/patient_model.dart';
// import 'package:doctor/models/message_model.dart';
// import 'package:doctor/models/user_model.dart';
// import 'package:doctor/models/doctor_model.dart';
class Services {
  static final auth = FirebaseAuth.instance;
  static final firestore = FirebaseFirestore.instance;
  // get all service providers
  static Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors(
      List<String> userIDs) {
    return firestore
        .collection("doctor")
        .where("id", whereIn: userIDs.isEmpty ? [''] : userIDs)
        // .where("id", isNotEqualTo: user.uid)
        .snapshots();
  }

  // get all service providers Ids
  static Stream<QuerySnapshot<Map<String, dynamic>>> getDoctorIds() {
    return firestore.collection("doctor").snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getpatient(
      List<String> userIDs) {
    return firestore
        .collection("patient")
        .where("id", whereIn: userIDs.isEmpty ? [''] : userIDs)
        // .where("id", isNotEqualTo: user.uid)
        .snapshots();
  }

  // get all service providers Ids
  static Stream<QuerySnapshot<Map<String, dynamic>>> getpatientIds() {
    return firestore.collection("paient").snapshots();
  }
}
// import 'package:fixlit/models/client_model.dart';
// import 'package:fixlit/models/message_model.dart';
// import 'package:fixlit/models/service_provider_model.dart';
// import 'package:fixlit/models/user_model.dart';

