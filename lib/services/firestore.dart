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

Future<void> createOrder(String userID, Order order, String status, String documentID) async {
  var _ref = _firestore.collection('orders').document(documentID);

  return _ref.setData({
    'documentID': documentID,
    'userID': userID,
    'address': order.address,
    'longitude': order.longitude,
    'latitude': order.latitude,
    'pickupTime': order.pickupTime,
    'serviceType': order.serviceType,
    'deliveryType': order.deliveryType,
    'bedsheets': order.bedsheets,
    'shirts': order.shirts,
    'duvets': order.duvets,
    'trousers': order.trousers,
    'natives': order.natives,
    'status': status,
    'price' : order.price,
    'username': order.username,
    'phone': order.phone
  });
}
