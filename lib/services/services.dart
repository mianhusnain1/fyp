import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/message_model.dart';
import 'package:doctor/models/patient_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Services {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static User get user => auth.currentUser!;
  // get all service providers
  static Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors(
      List<String> userIDs) {
    return firestore
        .collection("doctor")
        .where("id", whereIn: userIDs.isEmpty ? [''] : userIDs)
        // .where("id", isNotEqualTo: user.uid)
        .snapshots();
  }

  //getting my inbox users
  // to get all users
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(
      List<String> userIDs) {
    return firestore
        .collection("doctor")
        .where("id", whereIn: userIDs.isEmpty ? [''] : userIDs)
        // .where("id", isNotEqualTo: user.uid)
        .snapshots();
  }

  // to get all  my users
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsers() {
    return firestore
        .collection("patient")
        .doc(user.uid)
        .collection("inbox")
        .snapshots();
  }

  // to get all users
  static Stream<QuerySnapshot<Map<String, dynamic>>> getServiceAllUsers(
      List<String> userIDs) {
    return firestore
        .collection("patient")
        .where("id", whereIn: userIDs.isEmpty ? [''] : userIDs)
        .snapshots();
  }

  // to get all  my users
  static Stream<QuerySnapshot<Map<String, dynamic>>> getServiceMyUsers() {
    return firestore
        .collection("doctor")
        .doc(user.uid)
        .collection("inbox")
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

  // client update profile
  static Future<void> mainUpdateProfile(String name, email) async {
    await firestore.collection("users").doc(patient.id).update({
      "name": name,
    });
  }

  // client update profile
  static Future<void> patientUpdateProfile() async {
    await firestore.collection("patient").doc(patient.id).update({
      "name": patient.name,
    });
    mainUpdateProfile(patient.name, patient.email);
  }

  static Future<void> updateStatus(bool status) async {
    await firestore.collection("doctor").doc(doctor.id).update({
      "availability": status,
    });
  }

  // service update profile
  static Future<void> serviceUpdateProfile() async {
    await firestore.collection("doctor").doc(doctor.id).update({
      "name": doctor.name,
      "address": doctor.address,
      "phone": doctor.phone,
      "timings": doctor.schedule,
      "bio": doctor.bio,
      "catagory": doctor.catagory,
      "city": doctor.city,
    });

    mainUpdateProfile(doctor.name, doctor.email);
  }

  // get main profile for user decider
  static UserModel me = UserModel(
    name: "Name",
    id: user.uid,
    email: user.email!,
    created_at: "createdAt",
    role: "patient",
  );
  static Future<void> getMyProfile() async {
    await firestore.collection("users").doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = UserModel.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getMyProfile());
      }
    });
  }

  static PatientModel patient = PatientModel(
    name: "Name",
    id: user.uid,
    email: "Email",
    city: "createdAt",
    image: "null",
    phone: '',
    address: '',
  );
  static Future<void> patientProfile() async {
    await firestore
        .collection("patient")
        .doc(user.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        patient = PatientModel.fromJson(user.data()!);
      } else {
        await createUser().then((value) => patientProfile());
      }
    });
  }

  static DoctorModel doctor = DoctorModel(
    name: "Name",
    id: user.uid,
    email: "Email",
    created_at: "createdAt",
    image: "null",
    catagory: '',
    address: '',
    bio: '',
    phone: '',
    schedule: '',
    licence: '',
    availability: false,
    city: '',
    wrong_licence: false,
    wrong_id_card: false,
    approved: false,
  );
  static Future<void> doctorProfile() async {
    await firestore.collection("doctor").doc(user.uid).get().then((user) async {
      if (user.exists) {
        doctor = DoctorModel.fromJson(user.data()!);
      } else {
        await createUser().then((value) => doctorProfile());
      }
    });
  }

  //update profile pic
  static Future<void> updateProfilePic(File file) async {
    final ext = file.path.split(".").first;
    final ref = storage.ref().child("images/${user.uid}.$ext");
    await ref
        .putFile(file, SettableMetadata(contentType: "image/$ext"))
        .then((p0) {});
    patient.image = await ref.getDownloadURL();
    doctor.image = await ref.getDownloadURL();
    await firestore
        .collection(me.role == "patient" ? "patient" : "doctor")
        .doc(user.uid)
        .update({
      "image": me.role == "patient" ? patient.image : doctor.image,
    });
  } //update profile pic

  static Future<void> updateLicense(File file) async {
    final ext = file.path.split(".").first;
    final ref = storage.ref().child("license/${user.uid}.$ext");
    await ref
        .putFile(file, SettableMetadata(contentType: "image/$ext"))
        .then((p0) {});
    doctor.licence = await ref.getDownloadURL();
    await firestore.collection("doctor").doc(user.uid).update({
      "lic": doctor.licence,
    });
  }

  //
  //massages

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      DoctorModel chatUser) {
    return firestore
        .collection("users")
        .where("id", isEqualTo: chatUser.id)
        .snapshots();
  }

// for update active status of user
  static Future<void> upDateActiveStatus(bool isOnline) async {
    firestore.collection("users").doc(user.uid).update({
      "is_online": isOnline,
      "last_seen": DateTime.now().millisecondsSinceEpoch.toString(),
      // "token": me.token,
    });
  }

  // getting conversation id
  static String getConversationId(String id) => user.uid.hashCode <= id.hashCode
      ? "${user.uid}_$id"
      : "${id}_${user.uid}";
// to get all messages
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      DoctorModel user) {
    return firestore
        .collection("chats/${getConversationId(user.id)}/messages")
        .orderBy(
          "sent",
          descending: true,
        )
        .snapshots();
  }

  // to get all messages
  static Stream<QuerySnapshot<Map<String, dynamic>>> getServiceMessages(
      PatientModel user) {
    return firestore
        .collection("chats/${getConversationId(user.id)}/messages")
        .orderBy(
          "sent",
          descending: true,
        )
        .snapshots();
  }

  // delete message function
  static Future<void> deleteMessage(MessageModel message) async {
    await firestore
        .collection("chats/${getConversationId(message.toId)}/messages")
        .doc(message.sent)
        .delete();
    if (message.type == Type.image) {
      await storage.refFromURL(message.msg).delete();
    }
  }

  // update message
  static Future<void> updateMessage(
      MessageModel message, String updatedMsg) async {
    await firestore
        .collection("chats/${getConversationId(message.toId)}/messages")
        .doc(message.sent)
        .update({
      "msg": updatedMsg,
    });
  }

  // to send message
  static Future<void> sendMessage(
      DoctorModel chatUser, String msg, Type type) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final MessageModel message = MessageModel(
      msg: msg,
      toId: chatUser.id,
      read: '',
      type: type,
      fromId: user.uid,
      sent: time,
    );
    final ref = firestore
        .collection("chats/${getConversationId(chatUser.id)}/messages");
    await ref.doc(time).set(message.toJson());
  }

// update changes of muy profile
  static Future<void> sendFirstMessage(
      DoctorModel chatUser, String msg, Type type) async {
    firestore
        .collection("doctor")
        .doc(chatUser.id)
        .collection("inbox")
        .doc(user.uid)
        .set({}).then(
      (value) => sendMessage(chatUser, msg, type),
    );
  }

// update changes of muy profile
  static Future<void> sendServiceFirstMessage(
      PatientModel chatUser, String msg, Type type) async {
    firestore
        .collection("patient")
        .doc(chatUser.id)
        .collection("inbox")
        .doc(user.uid)
        .set({}).then(
      (value) => sendServiceMessage(chatUser, msg, type),
    );
  }

  // to send message
  static Future<void> sendServiceMessage(
      PatientModel chatUser, String msg, Type type) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final MessageModel message = MessageModel(
      msg: msg,
      toId: chatUser.id,
      read: '',
      type: type,
      fromId: user.uid,
      sent: time,
    );
    final ref = firestore
        .collection("chats/${getConversationId(chatUser.id)}/messages");
    await ref.doc(time).set(message.toJson());
  }

  // to read or not read message blue tick
  static Future<void> updateReadMessage(MessageModel message) async {
    firestore
        .collection("chats/${getConversationId(message.fromId)}/messages")
        .doc(message.sent)
        .update(
      {
        'read': DateTime.now().millisecondsSinceEpoch.toString(),
      },
    );
  }

// get last message to show
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
      DoctorModel user) {
    return firestore
        .collection("chats/${getConversationId(user.id)}/messages")
        .orderBy(
          "sent",
          descending: true,
        )
        .limit(1)
        .snapshots();
  }

  // funtion to send images between chat
  static Future<void> sendChatImage(DoctorModel chatUser, File file) async {
    final ext = file.path.split(".").last;
    final ref = storage.ref().child(
        "images/${getConversationId(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext");
    await ref
        .putFile(file, SettableMetadata(contentType: "image/$ext"))
        .then((p0) {});
    final imageUrl = await ref.getDownloadURL();
    await sendMessage(
      chatUser,
      imageUrl,
      Type.image,
    );
  }

// get last message to show
  static Stream<QuerySnapshot<Map<String, dynamic>>> getServiceLastMessage(
      PatientModel user) {
    return firestore
        .collection("chats/${getConversationId(user.id)}/messages")
        .orderBy(
          "sent",
          descending: true,
        )
        .limit(1)
        .snapshots();
  }

  // funtion to send images between chat
  static Future<void> sendServiceChatImage(
      PatientModel chatUser, File file) async {
    final ext = file.path.split(".").last;
    final ref = storage.ref().child(
        "images/${getConversationId(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext");
    await ref
        .putFile(file, SettableMetadata(contentType: "image/$ext"))
        .then((p0) {});
    final imageUrl = await ref.getDownloadURL();
    await sendServiceMessage(
      chatUser,
      imageUrl,
      Type.image,
    );
  }

  //
  static Future<void> createUser() async {
    final date = DateTime.now().toString();
    final pUser = UserModel(
      name: user.displayName.toString(),
      id: user.uid,
      email: user.email.toString(),
      created_at: date,
      role: "patient",
    );
    await firestore.collection("users").doc(user.uid).set(
          pUser.toJson(),
        );
  }

  //
  static Future<void> userCheck() async {
    await firestore.collection("users").doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = UserModel.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getMyProfile());
      }
    });
  }

  // for adding an chat user for our conversation
  static Future<bool> addChatUser(String email) async {
    final data = await firestore
        .collection('doctor')
        .where('email', isEqualTo: email)
        .get();
    if (data.docs.isNotEmpty && data.docs.first.id != user.uid) {
      //user exists
      firestore
          .collection('patient')
          .doc(user.uid)
          .collection('inbox')
          .doc(data.docs.first.id)
          .set({
        "email": email,
      });

      return true;
    } else {
      //user doesn't exists

      return false;
    }
  }

  //
}
