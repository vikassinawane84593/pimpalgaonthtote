import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/main_navigation.dart';
import 'otpGenerated.dart';

/*class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // login आहे
        if (snapshot.hasData) {
          return HomeScreen();
        }

        // login नाही
        return PhoneScreen();
      },
    );
  }
}*/

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasData){
            print('vikas is developer ${FirebaseAuth.instance.authStateChanges()}');

            return Mainnavigation();

          }

          return Otpgenerated();
        }
    );
  }
}


