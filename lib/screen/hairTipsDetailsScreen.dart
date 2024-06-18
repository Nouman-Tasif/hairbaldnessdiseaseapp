import 'package:flutter/material.dart';

import '../model/hairmodel.dart';

class HeadingDetailScreen extends StatelessWidget {
  final Heading heading;

  HeadingDetailScreen({required this.heading});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(heading.title),
        ),
        body: Column(
          children: [
            Image.asset(
              heading.image,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                heading.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
