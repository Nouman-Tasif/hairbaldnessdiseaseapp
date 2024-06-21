import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hairdisease/screen/tutorials_screen.dart';
import 'package:provider/provider.dart';
import '../constants/constatsvalue.dart';
import '../viewmodel/homeScreen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    homeScreenViewModel.tfliteFunction();
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
              child: Text("Hair Disease", style: TextStyle(color: Colors.white))),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(DynamicSize().user?.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var userData = snapshot.data!.data() as Map<String, dynamic>?;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${userData!['username']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Give Feedback'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    try {
                      viewModel.gotoLoginScreen(context);
                    } catch (e) {
                      Fluttertoast.showToast(msg: "Logout Failed");
                    }
                  }
                },
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/upload.jpg'),
                ),
              ),
              child: viewModel.selectedImage == null
                  ? const Text('')
                  : Image.file(
                viewModel.selectedImage!,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
              child: Text(
                viewModel.label,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
              child: Text(
                'The Accuracy is ${viewModel.confidence.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildCard(Icons.camera, 'Camera', Colors.blueGrey,
                            () => viewModel.pickImageFromCamera(context)),
                    _buildCard(Icons.image, 'Gallery', Colors.blueGrey,
                            () => viewModel.pickImageFromGallery(context)),
                    // _buildCard(
                    //   Icons.settings_overscan_sharp, 'Scan Image',
                    //   Colors.blueGrey, () => {},
                    // ),
                    _buildCard(Icons.info, 'Info', Colors.blueGrey,
                            () => Navigator.push(context, MaterialPageRoute(builder: (context) =>TutorialsScreen()))),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCard(
      IconData icon, String title, Color color, Function() onTap) {
    return Card(
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
