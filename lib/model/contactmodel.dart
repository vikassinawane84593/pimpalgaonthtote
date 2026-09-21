import 'package:flutter/foundation.dart';

class Contactmodel {

  final String name;
  final String number;
  final String tag;

  Contactmodel({

    required this.name,
    required this.number,
    required this.tag
});

  factory Contactmodel.fromMap(Map<String ,dynamic>map){
    return Contactmodel(
        name: map['name']??'',
        number: map['mobile']??'',
        tag: map['post']??''
    );
  }

}