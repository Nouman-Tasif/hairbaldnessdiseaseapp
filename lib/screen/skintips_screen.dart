import 'package:flutter/material.dart';
import 'package:hairdisease/screen/alopeciadetailsscreen.dart';

import 'hairdetailsscreen.dart';

class HairDisease extends StatelessWidget {
  HairDisease({super.key});

  final List<String> listForMalePatternBaldness = [
    '1) What is male pattern baldness?',
    'Alternative Names of male pattern baldness',
    'Symptoms of male pattern baldness',
    'Causes of male pattern baldness',
    'How I can prevent male pattern baldness?',
    '2) What is Alopecia areata?',
    'Alternative Names',
    'Symptoms',
    'Causes',
    'How is it treated?',
    'How can I prevent hair loss?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF1F4FC),
        appBar: AppBar(
          title: Text('Male Pattern Baldness Info'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listForMalePatternBaldness.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Hero(
                        tag: 'heading_$index',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            listForMalePatternBaldness[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                index: index,
                                title: listForMalePatternBaldness[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: const Hero(
                  tag: 'heading',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "Different types of Alopecia ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => AlopeciaDiseaseScreeen()));
                },
              ),
            )
          ],
        ));
  }
}
