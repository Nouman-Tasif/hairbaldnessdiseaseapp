import 'package:flutter/material.dart';
import 'package:hairdisease/screen/AlopeciatypeDetailsScreen.dart';

class AlopeciaDiseaseScreeen extends StatelessWidget {
  final List<String> headings = [
    'Alopecia Areata',
    'Persistent Patchy Alopecia Areata',
    'Alopecia Totalis',
    'Alopecia Universalis',
    'Diffuse Alopecia Areata',
    'Ophiasis Alopecia',
    'Androgenic Alopecia',
    'Male Pattern',
    'Female Pattern',
    'Cicatricial Alopecia',
    'Lichen Planopilaris',
    'Frontal Fibrosing Alopecia',
    'Central Centrifugal Cicatricial Alopecia (CCCA)',
    'Traction Alopecia',
    'Alopecia Barbae',
    'Postpartum Alopecia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Alopecia'),
      ),
      body: ListView.builder(
        itemCount: headings.length,
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
                    headings[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlopeciaTypeDetailsScreen(index: index, title: headings[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}