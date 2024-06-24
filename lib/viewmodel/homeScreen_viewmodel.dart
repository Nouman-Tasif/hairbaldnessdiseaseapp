import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:hairdisease/screen/hairstylepicturescreen.dart';
import 'package:image_picker/image_picker.dart';
import '../screen/login_screen.dart';

class HomeScreenViewModel with ChangeNotifier {
  File? selectedImage;
  double confidence = 0.0;
  String label = "";

  Future<void> pickImageFromGallery(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
    notifyListeners();
    await processImage(context, pickedImage.path);
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
    notifyListeners();
    await processImage(context, pickedImage.path);
  }

  Future<void> processImage(BuildContext context, String imagePath) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 3,  // Ensure this matches the number of categories
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null || recognitions.isEmpty) {
      debugPrint("No recognitions found.");
      showDiseasePopup(context, "Unable to recognize the image. Please try again with a different image.");
      return;
    }

    confidence = (recognitions[0]['confidence'] * 100);
    label = (recognitions[0]['label'].toString());
    debugPrint("Recognitions: ${recognitions.toString()}");

    if (confidence > 95) {
      if (label == "Alopecia Areata" || label == "Male Pattern Baldness") {
        showDiseasePopup(context, "You have $label. Consult a doctor.");
      } else if (label == "Hairstyle") {
        showNewHairStylePopUpMessage(context, "We recommend trying a new hairstyle.");

      } else {
        //showDiseasePopup(context, "The model is confident but the label is unrecognized.");
      }
    } else {
      showNewHairStylePopUpMessage(context, "We recommend trying a new hairstyle.");

    }

    notifyListeners();
  }

  void showDiseasePopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Disease Detection'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void showNewHairStylePopUpMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Disease Detection'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>HairStyleScreen()));

              },
            ),
          ],
        );
      },
    );
  }

  Future<void> tfliteFunction() async {
    String? res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    debugPrint("Model loaded: $res");
  }

  void gotoLoginScreen(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

  }
}
