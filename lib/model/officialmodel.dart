class OfficialModel {
  final String name;
  final String post;
  final String department;
  final String imageUrl;

  OfficialModel({
    required this.name,
    required this.post,
    required this.department,
    required this.imageUrl,
  });

  factory OfficialModel.fromMap(Map<String, dynamic> map) {
    return OfficialModel(
      name: map['name'] ?? '',
      post: map['post'] ?? '',
      department: map['department'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}