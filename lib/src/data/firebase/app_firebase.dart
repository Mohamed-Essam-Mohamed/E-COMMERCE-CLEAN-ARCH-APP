import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/data/model/firebase_model/app_user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppFirebase {
  static CollectionReference<AppUser> getCollectionUsers() {
    return FirebaseFirestore.instance
        .collection(AppUser.collectionName)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, options) =>
              AppUser.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addUser(AppUser user) {
    return getCollectionUsers().doc(user.token).set(user);
  }

  static Future<AppUser?> getUser(String uid) async {
    final snapshot = await getCollectionUsers().doc(uid).get();
    return snapshot.data();
  }

  //? image profile firebase storge
  static Reference getCollectionImagesProfile() {
    return FirebaseStorage.instance.ref();
  }

  static Future<void> addImageProfile({
    required String childName,
    required File path,
    required String authIdUser,
  }) {
    return getCollectionImagesProfile()
        .child(childName)
        .child(authIdUser)
        .putFile(path);
  }

  static Future<String> getUrlImageProfile({
    required String childName,
    required Uint8List uint8List,
    required String currentUser,
  }) async {
    Reference ref =
        getCollectionImagesProfile().child(childName).child(currentUser);
    UploadTask uploadTask = ref.putData(uint8List);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
