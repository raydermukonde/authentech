
import 'package:authentech/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  final String id;
  final String userName;
  String firstName;
  String lastName;
  final String email;
  String phoneNo;
  String profilePicture;

  UserModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.profilePicture,
  });

// Helper function to get the full name
String get fullName => '$firstName $lastName';

// Helper function to format phone number
String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNo);

// Static function to split the full name into first and last name
static List<String> nameParts(fullName) => fullName.split(' ');

// Static function to generate a username form the full name
static String generateUsername(fullName) {
  List<String> nameParts = fullName.split(" ");
  String firstName = nameParts[0].toLowerCase();
  String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

  String canelCaseUsername = "$firstName$lastName";
  String usernameWithPrefix = "user_$canelCaseUsername";


  return usernameWithPrefix;

  
}
// static function to create an empty user model
  static UserModel empty() => UserModel(
    id: '',
    userName: '',
    firstName: '',
    lastName: '',
    email: '',
    phoneNo: '',
    profilePicture: '',
  );

  // convert model to JSON structure for storage data in firebase
  Map<String, dynamic> toJson() {
    return {
      
      'UserName': userName,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNo,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1814661737.
  if (document.data() != null) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      userName: data['UserName'] ?? '',
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ?? '',
      email: data['Email'] ?? '',
      phoneNo: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  } else {
    return UserModel.empty();
  }
}


}
