import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hairdisease/screen/splash_screen.dart';
import 'package:hairdisease/viewmodel/forgot_viewmodel.dart';
import 'package:hairdisease/viewmodel/hairtips_viewmodel.dart';
import 'package:hairdisease/viewmodel/homeScreen_viewmodel.dart';
import 'package:hairdisease/viewmodel/login_viewmodel.dart';
import 'package:hairdisease/viewmodel/signup_viewmodel.dart';
import 'package:hairdisease/viewmodel/tabbar_viewmodel.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (context) => TabScreenViewModel()),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => HairTipsViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
