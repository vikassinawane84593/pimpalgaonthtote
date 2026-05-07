import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tester extends StatefulWidget {
  const Tester({super.key});

  @override
  State<Tester> createState() => _TesterState();
}

List<String>option=['app','web','android','ios'];
String selected = 'ios';

class _TesterState extends State<Tester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:DropdownButtonHideUnderline(child: DropdownButton(
          value: selected,
          items: option.map((value){
            return DropdownMenuItem(
                child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (v){
            setState(() {
              selected =v!;
            });
          },
        )
        ),
      ),
    );
  }
}