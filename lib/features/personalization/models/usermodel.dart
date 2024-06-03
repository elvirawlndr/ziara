import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/formatters/formatter.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;
  String profilePicture;
  String address;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.address
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(uid: '', name: '', email: '', phoneNumber: '', profilePicture: '', address: '');

  Map<String, dynamic> toJson() {
    return {
      'uid' : uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'address': address
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(uid: document.id, name: data['name'], email: data['email'], phoneNumber: data['phoneNumber'], profilePicture: data['profilePicture'] ?? '', address: data['address'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
