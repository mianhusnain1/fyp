import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
