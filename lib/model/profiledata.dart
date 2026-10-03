class profileModel {
  final String name;
  final String email;
  final String village;
  final String profession;
  final String? age;

  profileModel({
    required this.name,
    required this.email,
    required this.village,
    required this.profession,
    this.age,

  });

  factory profileModel.fromMap(Map<String, dynamic> map) {
    return profileModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      village: map['village'] ?? '',
      profession: map['profession'] ?? '',
      age: map['age']??'-',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'village': village,
      'profession': profession,
    };
  }
}