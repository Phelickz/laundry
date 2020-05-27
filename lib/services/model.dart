class Users {
  String email, username, photoUrl, uid, documentId, createdAt, phone;

  Users(this.documentId, this.email, this.createdAt, this.photoUrl, this.uid,
      this.username, this.phone);

  Users.fromMap(Map<String, dynamic> data) {
    phone = data['phone'];

    documentId = data['documentId'];
    email = data['email'];
    photoUrl = data['photoUrl'];
    uid = data['uid'];
    username = data['username'];
    createdAt = data['createdAt'].toString();
  }
}

class Order {
  String pickupTime;
  String deliveryType;
  String serviceType;
  String address;
  String longitude;
  String latitude;
  String bedsheets;
  String duvets;
  String shirts;
  String trousers;
  String natives;
  String status;
  String documentID;
  String userID;
  double price;
  String username;
  String phone;

  Order({
    this.bedsheets,
    this.natives,
    this.serviceType,
    this.trousers,
    this.address,
    this.deliveryType,
    this.duvets,
    this.latitude,
    this.longitude,
    this.pickupTime,
    this.shirts,
    this.status,
    this.documentID,
    this.userID,
    this.price,
    this.phone,
    this.username
  });

  factory Order.fromMap(doc) => Order(
    bedsheets: doc['bedsheets'],
    natives: doc['natives'],
    serviceType: doc['serviceType'],
    trousers: doc['trousers'],
    address: doc['address'],
    deliveryType: doc['deliveryType'],
    duvets: doc['duvets'],
    latitude: doc['latitude'],
    longitude: doc['longitude'],
    pickupTime: doc['pickupTime'],
    shirts: doc['shirts'],
    status: doc['status'],
    documentID: doc['documentID'],
    userID: doc['userID'],
    price: doc['price']
  );
}
