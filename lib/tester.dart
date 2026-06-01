/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImagePage extends StatefulWidget {
  const PickImagePage({super.key});

  @override
  State<PickImagePage> createState() => _PickImagePageState();
}

class _PickImagePageState extends State<PickImagePage> {

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            selectedImage != null
                ? Image.file(
              selectedImage!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            )
                : const Text('No Image Selected'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick Image'),
            ),

          ],
        ),
      ),
    );
  }
}*/