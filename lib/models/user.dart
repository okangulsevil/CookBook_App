import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String userFirstName;
  String userLastName;
  String userEmail;
  String userPassword;
  String userPhotoUrl;
  DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["userId"] != null),
        assert(map["userFirstName"] != null),
        assert(map["userLastName"] != null),
        assert(map["userEmail"] != null),
        assert(map["userPassword"] != null),
        assert(map["userPhotoUrl"] != null),
        userId = map["userId"],
        userFirstName = map["userFirstName"],
        userLastName = map["userLastName"],
        userEmail = map["userEmail"],
        userPassword = map["userPassword"],
        userPhotoUrl = map["userPhotoUrl"];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  User(
      {this.userId,
      this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userPassword,
      this.userPhotoUrl});

  void setClear() {
    userId = "";
    userFirstName = "";
    userLastName = "";
    userEmail = "";
    userPassword = "";
    userPhotoUrl = "";
  }
}
