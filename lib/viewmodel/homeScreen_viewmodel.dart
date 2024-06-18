import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import '../screen/login_screen.dart';

class HomeScreenViewModel with ChangeNotifier {
  File? selectedImage;
  double confidence = 0.0;
  String label = "";

  Future<void> pickImageFromGallery(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
    notifyListeners();
    await processImage(context, pickedImage.path);
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

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
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    if (recognitions == null) {
      debugPrint("---------------${recognitions.toString()}");
      return;
    }
    confidence = (recognitions[0]['confidence'] * 100);
    label = (recognitions[0]['label'].toString());
    debugPrint("---------------${recognitions.toString()}");



    if ((label == "Alopecia Areata" || label == "Male Pattern Baldness") && confidence > 90) {
      debugPrint("in dialogue message");
      showDiseasePopup(context, "You have a disease, consult to the doctor.");
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

  Future<void> tfliteFunction() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
  }

  gotoLoginScreen(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
