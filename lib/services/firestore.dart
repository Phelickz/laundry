

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_app/state/userState.dart';

import 'model.dart';


final _firestore = Firestore.instance;

getUsersData(UserNotifier userNotifier, String uid) async {
  QuerySnapshot snapshot = await _firestore
      .collection('userData')
      .where('uid', isEqualTo: uid)
      .getDocuments();

  List<Users> _usersList = [];

  snapshot.documents.forEach((document) async {
    Users user = Users.fromMap(document.data);
    _usersList.add(user);
  });

  userNotifier.userProfileData = _usersList;
}