import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/Auth/verifiotp.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';


class Otpgenerated extends StatefulWidget {
  @override
  State<Otpgenerated> createState() => _OtpgeneratedState();
}

class _OtpgeneratedState extends State<Otpgenerated> {
  
  final phoneController = TextEditingController();
  bool isLoading = false;
  final _Gloabelkey=GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  int? resendtoken;

  
  void sendotp() async {
    if(_Gloabelkey.currentState!.validate()) {
      setState(() => isLoading = true);

      
      _auth.verifyPhoneNumber(

          phoneNumber: "+91${phoneController.text.trim()}",

          verificationCompleted: (PhoneAuthCredential credential)async {
            await FirebaseAuth.instance.signInWithCredential(credential);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          verificationFailed: (FirebaseAuthException e) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$e')));
            },
          codeSent: (String verId, int? token){
            verificationId = verId;
            resendtoken=token;
            setState(() => isLoading = false);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OtpScreen(phone: phoneController.text, verificationId: verificationId!, token: resendtoken!)
                )
            );
          },

          codeAutoRetrievalTimeout: (String verId){
            verificationId = verId;
          });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _Gloabelkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: CircleAvatar(
                      backgroundColor: AppColour.circleavtarborder,
                      radius: 90,
                      child: CircleAvatar(
                        radius: 88,
                        backgroundImage: AssetImage('Assets/welcomepagephoto.png'),
                      ),
                    ),
                  ),
              
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
              
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      color: AppColour.loginbox,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withAlpha(180),
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
              
                    child: Column(
                      children: [
                  Text("Enter Mobile Number",
                      style: Theme.of(context).textTheme.titleMedium,),
              
                  SizedBox(height: 20),
                        TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
              
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter mobile number";
                              }
                              if (value.length != 10) {
                                return "Mobile number must be 10 digits";
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return "Only numbers allowed";
                              }
                              return null;
                            }
              
                  ),
              
                  SizedBox(height: 20),
              
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : sendotp,
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: isLoading
                          ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      )
                          : Text("Send OTP"),
                    ),
                  ),]
                  )
              
              
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}