import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  final String caption;
  final String fileName;
  final String imageUrl;
  final String name;
  final String publicId;
  final Timestamp? uploadedAt;

  ImageModel({
    required this.caption,
    required this.fileName,
    required this.imageUrl,
    required this.name,
    required this.publicId,
    this.uploadedAt,
  });

  // Model → Map
  Map<String, dynamic> toMap() {
    return {
      'caption': caption,
      'fileName': fileName,
      'imageUrl': imageUrl,
      'name': name,
      'publicId': publicId,
      'uploadedAt': uploadedAt,
    };
  }

  // Map → Model
  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      caption: map['caption'] ?? '',
      fileName: map['fileName'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      publicId: map['publicId'] ?? '',
      uploadedAt: map['uploadedAt'],
    );
  }
}