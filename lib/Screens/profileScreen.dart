import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/core/Widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,
      body: SafeArea(
        child: Stack(
          children: [

            // Background Image
            Container(
              height: 290,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/welcomepagephoto.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              children: [

                const SizedBox(height: 130),

                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColour.primary,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("Assets/vikas.jpg"),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

               
                Expanded(
                    child:Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: AppTheme.container,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                                          
                              buildTile(context,Icons.person, "Name", "Ramesh Kumar"),
                              buildDivider(),
                                          
                              buildTile(context,Icons.calendar_today, "Age", "27 Years"),
                              buildDivider(),
                                          
                              buildTile(context,Icons.work, "Work", "Farmer"),
                            ],
                          ),
                        ),
                      ),

                  ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
