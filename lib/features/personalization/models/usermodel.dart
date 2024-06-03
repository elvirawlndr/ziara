import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/formatters/formatter.dart';

class UserModel {
  final String id;
  String name;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(id: document.id, name: data['name'] ?? '', email: data['email'] ?? '', phoneNumber: data['phoneNumber'] ?? '', profilePicture: data['profilePicture'] ?? '');
    } else {
      throw Exception('Document data is null');
    }
  }
}
