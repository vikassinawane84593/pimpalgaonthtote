class UserModel {
  final String name;
  final String email;
  final String village;
  final String profession;
  final String pin;
  final bool approved;

  UserModel({
    required this.name,
    required this.email,
    required this.village,
    required this.profession,
    required this.pin,
    required this.approved,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': email,
      'village': village,
      'profession': profession,
      'pin': pin,
      'approved': approved,
    };
  }
}