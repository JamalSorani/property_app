// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🌎 Project imports:
import 'package:template_app/common/constant/enum.dart';

class SignUpParam {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final DateTime? birthdate;
  final Gender gender;
  final String? imageUrl;
  final String deviceToken;

  SignUpParam({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.birthdate,
    required this.gender,
    this.imageUrl,
    required this.deviceToken,
  });

  Future<Map<String, dynamic>> toMap() async {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'birthdate': birthdate?.toIso8601String(),
      'gender': gender.name,
      'imageUrl': imageUrl,
    };
  }
}
