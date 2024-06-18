import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../constants/constatsvalue.dart';
import '../viewmodel/signup_viewmodel.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        backgroundColor: const Color(0xffF1F4FC),
        // appBar: AppBar(
        //   title: const Center(child:  Text("Hair Care",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,))),
        // ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              start: DynamicSize.width(0.03, context),end: DynamicSize.width(0.03, context)),
          child: SingleChildScrollView(
            child: Form(
              key:_formField,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: DynamicSize.height(0.15, context),
                  ),
                  Center(
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: DynamicSize.width(0.055, context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 20, start: 10),
                    child: Text(
                      'Full name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.02, context),
                  ),
                  Card(
                    elevation: 4, // Set the elevation here
                    shadowColor: Colors.grey, // Set the shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: viewModel.username,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "User name",
                          hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                          border: InputBorder.none,
                          // Remove the border
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter full name";
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 20, start: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.02, context),
                  ),
                  Card(
                    elevation: 4, // Set the elevation here
                    shadowColor: Colors.grey, // Set the shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: viewModel.email,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                          border: InputBorder.none,
                          // Remove the border
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter email";
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 20, start: 10),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.02, context),
                  ),
                  Card(
                    elevation: 4, // Set the elevation here
                    shadowColor: Colors.grey, // Set the shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        obscureText: viewModel.isObscure,
                        controller: viewModel.password,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
                          border: InputBorder.none,
                          // Remove the border
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              viewModel.isObscure =
                              !viewModel.isObscure;
                              viewModel.updateStates();
                            },
                            child: Icon(viewModel.isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter your password";
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.09, context),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formField.currentState !=
                            null &&
                            _formField.currentState!
                                .validate()) {
                          viewModel.registerMethod(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.03, context),
                  ),
                  Center(
                    child: Text(
                      "Already a member?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: DynamicSize.width(0.055, context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: DynamicSize.height(0.03, context),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.blue), // Add a blue border
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
