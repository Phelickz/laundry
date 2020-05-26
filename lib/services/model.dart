class Users {
  String email,
      username,
      photoUrl,
      uid,
      documentId,
      createdAt,
      phone;

  Users(
      this.documentId,
      this.email,
      this.createdAt,
      this.photoUrl,
      this.uid,
      this.username,
      this.phone);

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