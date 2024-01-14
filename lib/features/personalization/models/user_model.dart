import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_store/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phonenumber,
    required this.profilePicture,
  });

  final String id;
  final String username;
  final String email;
  String firstname;
  String lastname;
  String phonenumber;
  String profilePicture;

  // getter for fullname
  String get fullname => '$firstname $lastname';

  // getter for formatted phone number
  String get formattedPhonenumber =>
      AppFormatter.formatPhoneNumber(phonenumber);

  // getter to split fullname into firstname and lastname
  static List<String> nameParts(fullname) => fullname.split(" ");

  // function generate username from first and last name
  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstname$lastname';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  // function to create empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstname: '',
        lastname: '',
        username: '',
        email: '',
        phonenumber: '',
        profilePicture: '',
      );

  // function to convert usermodel data into json
  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstname,
      "LastName": lastname,
      "Email": email,
      "Username": username,
      "Phonenumber": phonenumber,
      "ProfilePicture": profilePicture,
    };
  }

  /// Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        id: document.id,
        firstname: data?["FirstName"] ?? '',
        lastname: data?["LastName"] ?? '',
        username: data?["Username"] ?? '',
        email: data?["Email"] ?? '',
        phonenumber: data?["Phonenumber"] ?? '',
        profilePicture: data?["ProfilePicture"] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
