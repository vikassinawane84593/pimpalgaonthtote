import 'package:flutter/material.dart';

class Latestnews extends StatelessWidget {
  final String chiptitle;
  final String title;
  final String info;
  final String imagepath;
  final int time;

  const Latestnews({
    super.key,
    required this.chiptitle,
    required this.title,
    required this.info,
    required this.imagepath,
    required this.time,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagepath,
              height: 150,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //  SizedBox(height: 23,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 30,
                  width: 100,
                  child: Chip(
                    backgroundColor: Color(0xFFDAFAE7,),
                    label: Text(
                      chiptitle,
                      style: TextStyle(
                          color: Color(0xFF3F875C,),
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),

                  ),
                ),
              ),

              SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 14),
                  softWrap: true,
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  info,
                  softWrap: true,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                      size: 19,
                    ),

                    SizedBox(width: 5,),

                    Text(
                      '${time} तासांपूर्वी',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(color: Colors.grey,),
              )
            ],
          ),
        )


      ],
    );
  }
}



