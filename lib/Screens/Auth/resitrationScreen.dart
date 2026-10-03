
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/Auth/logiscreen.dart';
import 'package:pimpalgaonthote/model/usedmodel.dart';

class Resitrationscreen extends StatefulWidget {
  const Resitrationscreen({super.key});

  @override
  State<Resitrationscreen> createState() => _ResitrationscreenState();
}

class _ResitrationscreenState extends State<Resitrationscreen> {

  bool creatpinshow = false;
  bool reEnterpinShow = false;

  bool isloading = true;

  TextEditingController pinController = TextEditingController();
  TextEditingController reEnterpinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController villageController = TextEditingController();
   String ?proffesion = 'शेतकरी';
   String ? village = 'िंपळगांव थोटेे';
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final List<String> bhokardanVillages = ['आडगाव', 'अलापूर', 'अन्वापाडा', 'अन्वा', 'आव्हाना', 'बाभुळगाव', 'बामखेडा', 'बनेगाव', 'बारंजळा (लोखंडे)', 'बारंजळा (साबळे)', 'बेलुरा', 'भायडी', 'भिवपूर', 'भोरखेडा', 'बोरगाव', 'बोरगाव खडक', 'बोरगाव तारू', 'चांदई एक्को', 'चांदई टेपली', 'चांदई ठोंबरी', 'चिंचोली', 'चोरहाळा', 'दगडवाडी', 'दहिगाव', 'दानापूर', 'दौतपूर', 'दावरगाव', 'देहेड', 'देऊळगाव', 'देऊळगाव तड', 'धावडा', 'धोंडखेडा', 'एकेफळ', 'फत्तेपूर', 'फुलेनगर', 'गारखेडा', 'गव्हाण संगमेश्वर', 'गोद्री', 'गोकुळ', 'गोशेगाव', 'हसनाबाद', 'हिसोडा बु.', 'हिसोडा खु.', 'इब्राहिमपूर', 'इटा', 'जयदेववाडी', 'जैनपूर', 'जळगाव', 'जनेफळ', 'जनेफळ दाभाडी', 'जावखेडा बु.', 'जावखेडा खु.', 'जावखेडा ठोंबरी', 'जोमाळा', 'कल्याणी', 'करजगाव', 'करळवाडी', 'काठोरा', 'काठोरा बाजार', 'केदारखेडा', 'खडगाव', 'खडकी', 'खामखेडा', 'खंडाळा', 'खापरखेडा', 'कोडा', 'कोडोली', 'कोळेगाव', 'कोपर्डा', 'कोसगाव', 'कोटा दाभाडी', 'कोठा जहागीर', 'कोठा कोळी', 'क्षीरसागर', 'कुकडी', 'कुंभारणी', 'लतीफपूर', 'लेहा', 'लिंगेवाडी', 'लोंगाव', 'माळेगाव', 'माळकापूर', 'माळखेडा', 'मनापूर', 'मसनपूर', 'मेहगाव', 'मेरखेडा', 'मोहलाई', 'मुठाड', 'नळणी बु.', 'नळणी खु.', 'नांजा', 'नसीराबाद', 'निंबोळा', 'निमगाव', 'पद्मावती', 'पालसखेडा दाभाडी', 'पालसखेडा मुर्तड', 'पालसखेडा पिंपळे', 'पालसखेडा ठोंबरी', 'पंढरपूर', 'पारध बु.', 'पारध खु.', 'पेरजापूर', 'पिंपळगाव', 'पिंपळगाव बराव', 'पिंपळगाव कोलते', 'पिंपळगाव सेर्मुळकी', 'पिंपळगाव सुतार',
    'पिंपळगांव थोटेे', 'पिंपरी', 'पोखरी', 'प्रल्हादपूर', 'राजाळा', 'राजापूर', 'राजूर', 'रामनगर', 'रामपूर बु.', 'रेलगाव', 'समर्थ नगर', 'सावंगी औघडराव', 'सावखेडा', 'सेलूड', 'सिपोरा बाजार', 'सिरसगाव', 'सिरसगाव वाघरूळ', 'सोयगाव देवी', 'सुभानपूर', 'सुंदरवाडी', 'सुरंगळी', 'ताडेगाव', 'ताडेगाववाडी', 'ताडकळस', 'टाकळी बाजाड', 'टाकळी भोकरदन', 'टाकळी हिवर्डी', 'तळेगाव', 'तळणी', 'तांदुळवाडी', 'तपोवन', 'थिगळखेडा', 'उमरखेडा', 'वझीरखेडा', 'विरेगाव', 'विझोरा', 'वडोद तांगडा', 'वडोणा', 'वाडी बु.', 'वाडी खु.', 'वडशेद', 'वाकडी', 'वाळसा दावरगाव', 'वाळसा वडाळा', 'वाळसाखालसा', 'वाळसावंगी', 'वरूड बु.'];

  final List<String> professions = [
    'शेतकरी',
    'शेतमजूर',
    'दुग्ध व्यवसाय',
    'पशुपालन',
    'कुक्कुटपालन',
    'व्यापारी',
    'दुकानदार',
    'हॉटेल व्यवसाय',
    'मेकॅनिक',
    'इलेक्ट्रिशियन',
    'प्लंबर',
    'सुतार',
    'गवंडी',
    'पेंटर',
    'शिंपी',
    'मोबाईल रिपेअरिंग',
    'वाहन चालक',
    'ऑटो चालक',
    'शिक्षक',
    'डॉक्टर',
    'नर्स',
    'सरकारी कर्मचारी',
    'खाजगी कर्मचारी',
    'व्यवसायिक',
    'विद्यार्थी',
    'गृहिणी',
    'नोकरी',
    'इतर'
  ];


  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        width: 0.5,
        color: Colors.grey
    ),

  );
  Future<void> resitration(UserModel user) async {
    setState(() {
      isloading = false;

    });
    try {


      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.pin,
      );

      final uid = credential.user!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({
        'name': user.name,
        'email': user.email,
        'village': user.village,
        'profession': user.profession,
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('नोंदणी यशस्वी झाली'),
        ),
      );
      Future.delayed(Duration(seconds: 3));

      setState(() {
        isloading=true;
      });

      Navigator.push(
          context, MaterialPageRoute(
          builder: (context)=> LoginScreen()
      )
      );

    } on FirebaseAuthException catch (e) {

      String message = 'नोंदणी अयशस्वी झाली';

      if (e.code == 'email-already-in-use') {
        message = 'हा ई-मेल आधीच नोंदणीकृत आहे';
      } else if (e.code == 'weak-password') {
        message = 'पासवर्ड कमजोर आहे';
      } else if (e.code == 'invalid-email') {
        message = 'ई-मेल पत्ता योग्य नाही';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100,right: 100,top: 30,bottom: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('Assets/welcomepagephoto.png'),
        
            )
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
            const  SizedBox(height: 0,),
        
            Text(
                'नवीन नोंदणी करा',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [


                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        focusedBorder: border,
                        enabledBorder: border,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'संपूर्ण नाव'
                      ),

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'नाव टाका';
                        }

                        if (!RegExp(r'^[a-zA-Z\u0900-\u097F ]+$').hasMatch(value.trim())) {
                          return 'फक्त अक्षरे टाका';
                        }

                        if (value.trim().length < 4) {
                          return 'नाव किमान 4 अक्षरांचे असावे';
                        }

                        return null;
                      },

                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                            prefixIcon: Icon(Icons.person),
                            hintText: 'ई-मेल पत्ता',
                        ),
                        keyboardType: TextInputType.emailAddress,



                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'ई-मेल पत्ता टाका';
                          }

                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value.trim())) {
                            return 'योग्य ई-मेल पत्ता टाका';
                          }

                          return null;
                        },


                      )

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: DropdownButtonFormField<String>(

                        initialValue: 'पिंपळगांव थोटेे',
                          decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                            prefixIcon: Icon(Icons.location_on),
                          ),
                          items: bhokardanVillages.map((vilage){



                            return  DropdownMenuItem(
                                value: vilage,
                                child: Text(vilage));
                          }).toList(),

                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),

                          onChanged: (value){

                          setState(() {
                            village = value;
                          });

                          }

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: DropdownButtonFormField<String>(
                          initialValue: 'शेतकरी',
                          decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                            prefixIcon: Icon(Icons.work),
                          ),
                          items: professions.map((vilage){



                            return  DropdownMenuItem(
                                value: vilage,
                                child: Text(vilage));
                          }).toList(),

                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),

                          onChanged: (value){

                            setState(() {
                              proffesion = value;
                            });
                          }

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        obscureText: creatpinshow,

                        controller: pinController,

                        decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(

                              onPressed: (){

                                setState(() {
                                  creatpinshow = !creatpinshow;
                                });
                              },
                              icon: creatpinshow
                                  ? Icon(Icons.visibility_off)
                                  :Icon(Icons.visibility)
                            ),
                            hintText: 'पिन तयार करा'
                        ),

                        validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'पासवर्ड टाका';
                        }

                        if (value.length < 6) {
                          return 'पासवर्ड किमान 6 अक्षरांचा असावा';
                        }

                        return null;
                      },

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: reEnterpinController,

                        obscureText: reEnterpinShow,
                        decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(

                                onPressed: (){

                                  setState(() {
                                    reEnterpinShow = !reEnterpinShow;
                                  });
                                },
                                icon:  reEnterpinShow
                                    ? Icon(Icons.visibility)
                                    :Icon(Icons.visibility_off)
                            ),

                            hintText: 'पिनची पुष्टी करा'
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'PIN पुन्हा टाका';
                          }

                          if (value != pinController.text) {
                            return 'PIN जुळत नाही';
                          }

                          return null;
                        },

                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: isloading
                            ?(){

                            if (_formkey.currentState!.validate()) {
                              final user = UserModel(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                village: villageController.text,
                                profession: proffesion!,
                                pin: pinController.text.trim(),
                                approved: false,
                              );

                              resitration(user);
                            }



                          }
                          :null,

                          child: isloading
                              ?Text(

                              'नोंदणी करा',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          )
                              :CircularProgressIndicator(
                            color: Colors.black,
                          )
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text('आधीच खाते आहे?'),
                        ),

                        TextButton(

                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            onPressed: (){

                            },
                            child: Text('लॉगिन करा')
                        )
                      ],
                    )


                  ],
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
