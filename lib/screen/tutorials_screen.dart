import 'package:flutter/material.dart';


class TutorialsScreen extends StatefulWidget {

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4FC),
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTutorialStep(
              context,
              icon: Icons.app_registration,
              title: 'Open the App Hair DX',
              description: 'Sign Up if you are not a member by entering your full name, email, and password.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.login,
              title: 'Login',
              description: 'If you have already registered on Hair DX, then login by entering your email and password.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.home,
              title: 'Home Page',
              description: 'Click on Home page for the detection of diseases. Click on Camera for capturing the hair image.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.photo,
              title: 'Browse Image',
              description: 'If you have an image in the gallery, then click on Browse. Select the image from the browser and see the result.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.health_and_safety,
              title: 'Hair Tips and Treatments',
              description: 'If you want to study about different hair tips and home treatments, then click on Hair Related Home Tips and Treatments.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.info,
              title: 'Different Hair Diseases',
              description: 'If you want to study about different hair diseases, then click on Different Hair Diseases.',
            ),
            _buildTutorialStep(
              context,
              icon: Icons.person,
              title: 'Profile',
              description: 'Go to Profile for feedback and logout.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorialStep(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Theme.of(context).primaryColor),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
