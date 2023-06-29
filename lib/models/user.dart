import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        "username": username,
        'email': email,
        'photo': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'] ?? "",
      email: snapshot["email"] ?? "",
      uid: snapshot["uid"] ?? "",
      photoUrl: snapshot["photo"] ?? "",
      bio: snapshot["bio"] ?? "",
      followers: snapshot["followers"] ?? "",
      following: snapshot["following"] ?? "",
    );
  }
}
