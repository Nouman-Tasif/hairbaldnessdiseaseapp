import 'package:flutter/material.dart';

class HairStyleScreen extends StatelessWidget {
  const HairStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a list of image paths
    List<String> imagePaths = List.generate(
      50,
          (index) => 'assets/images/hairstyle${index + 1}.jpg',
    );

    return Scaffold(
      backgroundColor: const Color(0xffF1F4FC),
      appBar: AppBar(
        title: const Text("Hair Styles"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
