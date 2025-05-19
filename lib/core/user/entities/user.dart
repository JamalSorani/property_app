class User {
  final String id;
  final String fullName;
  final String accessToken;
  final String refreshToken;

  User({
    required this.fullName,
    required this.accessToken,
    required this.refreshToken,
    required this.id,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $fullName, accessToken: $accessToken, refreshToken: $refreshToken}';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  User copyWith({
    String? accessToken,
    String? refreshToken,
    String? id,
    String? fullName,
    String? type,
    bool? hasVehicle,
    bool? hasDefaultStartPoint,
  }) {
    return User(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
    );
  }
}
