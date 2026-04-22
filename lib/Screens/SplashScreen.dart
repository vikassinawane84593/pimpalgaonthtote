
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Auth/otpGenerated.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

   Future.delayed(Duration(seconds: 3),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PhoneScreen()));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Image.asset(
            'Assets/welcomepagephoto.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 65,top: 50,),
                child: Text(
                  "पिंपळगांव थोटे",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 68,),
                child: Text(
                  "मध्ये आपले स्वागत आहे",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),


           Padding(
             padding: const EdgeInsets.only(left: 170,top: 600),
             child: CircularProgressIndicator(
               color: AppColour.textPrimary,

             ),
           )

        ],
      ),
    );
  }
}