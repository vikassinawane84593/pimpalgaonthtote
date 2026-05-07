import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String verificationId;
  final int token;
   OtpScreen({super.key, required this.phone,required this.verificationId,required this.token});

  @override
  State<OtpScreen> createState() => _OtpScreenState();

}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  bool resendisLoading = false;
  bool verifiisLoading = false;
  int seconds = 20;
  final _Globalkey=GlobalKey<FormState>();
  Timer? timer;
  final _auth = FirebaseAuth.instance;
  String? currentverID;
  int? curenttoken;

  @override
  void initState() {
    super.initState();

    currentverID=widget.verificationId;
    curenttoken=widget.token;

    startTimer();
  }

   
  void startTimer() {
    seconds = 20;

    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        t.cancel();
      }
    });
  }


  void resendOtp() async {
    setState(() => resendisLoading = true);

    _auth.verifyPhoneNumber(

        phoneNumber: widget.phone,
        forceResendingToken: curenttoken,


        verificationCompleted: (PhoneAuthCredential crediantial){
          FirebaseAuth.instance.signInWithCredential(crediantial);
    },
        verificationFailed: (FirebaseAuthException e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('WROMG OTP'))
      );
      resendisLoading=false;
        },

        codeSent: (String verId, int? token){
          currentverID=verId;
          curenttoken=token;
          resendisLoading=false;
        },

        codeAutoRetrievalTimeout: (String verId){

        });



    startTimer(); // restart timer
  }

  ///  Verify OTP
  void verifyOtp() async {
    if (_Globalkey.currentState!.validate()) {
      setState(() => verifiisLoading = true);
      try{

      PhoneAuthCredential credentials=PhoneAuthProvider.credential(
          verificationId:currentverID!,
          smsCode: otpController.text
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);
      setState(() => verifiisLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verified")),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    }
    catch(e){
      setState(() => verifiisLoading = false);


      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error'))
        );
      }
    }

  }

  @override
  void dispose() {
    timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                /// 🔵 Image
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
            
                /// 📦 Box
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
            
                      /// Title
                      Text(
                        "Enter OTP",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
            
                      SizedBox(height: 10),
            
                      /// Phone
                      Text(
                        "OTP sent to ${widget.phone}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
            
                      SizedBox(height: 20),
            
                      /// OTP Field
                      Form(
                        key: _Globalkey,
                        child: TextFormField(
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Enter 6 digit OTP",
                            counterText: "",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter OTP";
                            }
                            if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                              return "Enter valid 6 digit OTP";
                            }
                            return null;
                          },
                        ),
                      ),
            
                      SizedBox(height: 10),
            
                      /// ⏱ Timer / Resend
                      seconds > 0
                          ? Text(
                        "Resend OTP in $seconds sec",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                          : TextButton(
                        onPressed: resendisLoading ? null : resendOtp,
                        child: resendisLoading
                            ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : Text("Resend OTP",style: Theme.of(context).textTheme.titleSmall,),
                      ),
            
                      SizedBox(height: 20),
            
                      /// Verify Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: verifiisLoading ? null : verifyOtp,
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: verifiisLoading
                              ? SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          )
                              : Text("Verify OTP"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}