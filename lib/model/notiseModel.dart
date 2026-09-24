
import 'package:cloud_firestore/cloud_firestore.dart';

class NotiseModel{

  final String warning;
  final String type;
  final DateTime date;
  final DateTime? createdAt;

  NotiseModel({
    required this.warning,
    required this.type,
    required this.date,
    this.createdAt
  });
  factory NotiseModel.fromMap(Map<String,dynamic>map){
    return NotiseModel(

        warning: map['warning'],
        type: map['type'],
        date: (map['date'] as Timestamp).toDate(),
        createdAt: (map['createdAt'] as Timestamp).toDate()

    );
  }

  Map<String,dynamic>toMap(){
    return {
      'warning': warning,
      'type': type,
      'date': date,
      'createdAt': FieldValue.serverTimestamp(),

    };
  }

}