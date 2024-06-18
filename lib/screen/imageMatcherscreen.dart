//
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
//
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// class ImageMatcherScreen extends StatefulWidget {
//   File? selectedImage;
//    ImageMatcherScreen({super.key,required this.selectedImage
//   });
//
//   @override
//   State<ImageMatcherScreen> createState() => _ImageMatcherScreenState();
// }
//
// class _ImageMatcherScreenState extends State<ImageMatcherScreen> {
//
//   final sift = SIFT.create();
//   List<Uint8List> hairScalpingImages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchHairScalpingImages();
//   }
//
//   Future<void> fetchHairScalpingImages() async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     ListResult result =
//     await storage.ref().child('Alopecia Areta').listAll();
//
//     for (Reference ref in result.items) {
//       Uint8List? imageData = await ref.getData();
//       setState(() {
//         hairScalpingImages.add(imageData!);
//       });
//     }
//   }
//
//
//
//   Future<void> matchHairScalp() async {
//     if (widget.selectedImage == null) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Please select an image.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     }
//
//     img.Image? uploadedImage = img.decodeImage(widget.selectedImage?.readAsBytesSync());
//     final keypoints = await sift.detect(uploadedImage);
//     final descriptors = await sift.compute(uploadedImage, keypoints);
//
//     bool foundMatch = false;
//
//     for (Uint8List? hairScalpingImageData in hairScalpingImages) {
//       img.Image? hairScalpingImage = img.decodeImage(hairScalpingImageData!);
//
//       final hairScalpingKeypoints =
//       await sift.detect(hairScalpingImage);
//       final hairScalpingDescriptors =
//       await sift.compute(hairScalpingImage, hairScalpingKeypoints);
//
//       final matcher =
//       DescriptorMatcher.create(DescriptorMatcher.BRUTEFORCE_HAMMING);
//       final matches = await matcher.knnMatch(descriptors, hairScalpingDescriptors, 2);
//
//       final goodMatches = <dynamic>[];
//       for (final match in matches) {
//         if (match.length >= 2 && match[0].distance < 0.7 * match[1].distance) {
//           goodMatches.add(match[0]);
//         }
//       }
//
//       final similarityScore = goodMatches.length / keypoints.length;
//
//       if (similarityScore > 0.5) {
//         foundMatch = true;
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Hair Scalp Match'),
//               content: Text('The uploaded image matches a hair scalp.'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//         break;
//       }
//     }
//
//     if (!foundMatch) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('No Match Found'),
//             content: Text('The uploaded image does not match any hair scalp.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hair Scalp Matcher'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             widget.selectedImage != null
//                 ? Image.file(
//               widget.selectedImage!,
//               width:
//               200,
//               height: 200,
//             )
//                 : Container(
//               width: 200,
//               height: 200,
//               child: Placeholder(),
//             ),
//             SizedBox(height: 20),
//
//             ElevatedButton(
//               onPressed: matchHairScalp,
//               child: Text('Match Hair Scalp'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }