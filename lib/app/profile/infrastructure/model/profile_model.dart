// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final String phonNumber;
  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.phonNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthDate': birthDate.toIso8601String(),
      'phonNumber': phonNumber,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      birthDate: DateTime.parse(map['birthDate']),
      phonNumber: map['phonNumber'] as String,
    );
  }

  factory ProfileModel.fakeData() {
    return ProfileModel(
      firstName: 'ربيع',
      lastName: 'زيات',
      email: 'rabiea@gmail.com',
      birthDate: DateTime.now(),
      phonNumber: '0911111111',
    );
  }
}
