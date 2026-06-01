import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  void clearcontrooler(){
    nameController.clear();
    mobileController.clear();
    problemController.clear();
  }

  String selectedProblem = "इतर";

  List<String> problems = [
    "पाणीपुरवठा",
    "वीज",
    "रस्ता",
    "स्वच्छता",
    "इतर",
  ];
  final _Globelkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        title: const Text(
          "तक्रार नोंदवा",
        )
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          padding: const EdgeInsets.all(16),

          decoration: AppTheme.container,
          child: Form(
            key: _Globelkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TOP TEXT
                const Text(
                  "गाव स्वच्छ आणि सुरक्षित ठेवण्यासाठी तुमची तक्रार नोंदवा",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 25),

                /// NAME
                const Text(
                  "तुमचे नाव",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: nameController,

                  decoration: InputDecoration(
                    hintText: "नाव लिहा",

                    filled: true,
                    fillColor: const Color(0xfff3f3f3),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {

                    // Empty check
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }

                    // Minimum length
                    if (value.length < 3) {
                      return "Name must be at least 3 letters";
                    }

                    // Only letters and spaces
                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return "Only letters allowed";
                    }

                    return null;
                  },

                ),

                const SizedBox(height: 20),

                /// MOBILE
                const Text(
                  "मोबाईल नंबर",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,

                  decoration: InputDecoration(
                    hintText: "मोबाईल नंबर",

                    filled: true,
                    fillColor: const Color(0xfff3f3f3),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please enter mobile number";
                    }

                    // Length check
                    if (value.length != 10) {
                      return "Mobile number must be 10 digits";
                    }

                    // Number check
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Only numbers allowed";
                    }

                    return null;

                  },

                ),

                const SizedBox(height: 20),


                const Text(
                  "समस्या प्रकार",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),

                  decoration: BoxDecoration(

                    color: const Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedProblem,
                      isExpanded: true,

                      items:problems.map((value){
                        return DropdownMenuItem(
                            value: value,
                          child:Text(value,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProblem = value!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                const Text(
                  "समस्या माहिती",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: problemController,
                  maxLines: 5,

                  decoration: InputDecoration(
                    hintText: "तुमची समस्या लिहा",

                    filled: true,
                    fillColor: const Color(0xfff3f3f3),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {

                    if (value == null || value.trim().isEmpty) {
                      return "Please describe your problem";
                    }

                    if (value.trim().length < 10) {
                      return "Problem must be at least 10 characters";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),


                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {
                      if(_Globelkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("तक्रार पाठवली"),
                          ),
                        );
                        clearcontrooler();
                      }
                    },

                    child: const Text(
                      "तक्रार पाठवा",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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