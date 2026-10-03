import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  bool isloading = true;

  Future<void> login() async {
    setState(() {
      isloading = false;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('लॉगिन यशस्वी झाले'),
        ),
      );

      setState(() {
        isloading = true;
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));

    } on FirebaseAuthException catch (e) {
      String message = 'लॉगिन अयशस्वी झाले';

      if (e.code == 'user-not-found') {
        message = 'या ई-मेलने खाते सापडले नाही';
      } else if (e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        message = 'ई-मेल किंवा पासवर्ड चुकीचा आहे';
      } else if (e.code == 'invalid-email') {
        message = 'योग्य ई-मेल पत्ता टाका';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      setState(() {
        isloading = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 30),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('Assets/welcomepagephoto.png'),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Text(
                      'पिंपळगांव',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.orange,height: 0.8,),
                    ),
                    Text(
                      ' थोटे',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(height: 0.8),
                    ),
        
        
                  ],
                ),
        
              ),
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
              
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'ई-मेल पत्ता',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value
                              .trim()
                              .isEmpty) {
                            return 'ई-मेल पत्ता टाका';
                          }
              
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value.trim())) {
                            return 'योग्य ई-मेल पत्ता टाका';
                          }
              
                          return null;
                        },
                      ),
              
                      const SizedBox(height: 16),
              
                      TextFormField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'पासवर्ड',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'पासवर्ड टाका';
                          }
              
                          return null;
                        },
                      ),
              
                      const SizedBox(height: 25),
              
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          child: isloading
                          ?const Text(
                            'लॉगिन करा',
                            style: TextStyle(fontSize: 18),
                          )
                              :CircularProgressIndicator(
                          color: Colors.black,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}