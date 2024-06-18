import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../viewmodel/hairtips_viewmodel.dart';
import 'hairTipsDetailsScreen.dart';

class HairTipsScreen extends StatelessWidget {
  const HairTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HairTipsViewModel>(builder: (context, viewmodel, _) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Hair Tips")),
        ),
        body: ListView.builder(
          itemCount: viewmodel.headings.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeadingDetailScreen(heading: viewmodel.headings[index]),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset(
                      viewmodel.headings[index].image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        viewmodel.headings[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
