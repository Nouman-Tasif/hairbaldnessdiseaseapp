import 'package:flutter/material.dart';
import 'package:hairdisease/screen/signupscreen.dart';

import 'package:provider/provider.dart';

import '../constants/constatsvalue.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: const Color(0xffF1F4FC),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: DynamicSize.height(0.15, context)),
                    Center(
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DynamicSize.width(0.055, context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.02, context)),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: viewModel.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Enter your email";
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.02, context)),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          obscureText: viewModel.isObscure,
                          controller: viewModel.password,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                viewModel.isObscure = !viewModel.isObscure;
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
                    SizedBox(height: DynamicSize.height(0.02, context)),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: (){
                          viewModel.forgotPasswordNavigation(context);
                        },
                        child: const Center(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.07, context)),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            viewModel.loginMethod(context);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.03, context)),
                    Center(
                      child: Text(
                        "Don't have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DynamicSize.width(0.055, context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.03, context)),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpScreen()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Sign Up',
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
      },
    );
  }
}
