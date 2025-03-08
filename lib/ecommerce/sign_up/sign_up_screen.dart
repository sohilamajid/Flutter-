import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_revision_1/ecommerce/login/login_screen.dart';
import 'package:flutter_revision_1/ecommerce/login/widgets/custom_text_field.dart';
import 'package:flutter_revision_1/ecommerce/sign_up/cubit/sign_up_cubit.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Welcome to our\ngrocery shop",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                            height: height,
                            text: "Name",
                            controller: _nameController),
                        SizedBox(
                          height: height * .03,
                        ),
                        CustomTextField(
                          height: height,
                          text: "Email",
                          controller: _emailController,
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        CustomTextField(
                          height: height,
                          text: "Phone",
                          controller: _phoneController,
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        CustomTextField(
                          height: height,
                          text: "Password",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            BlocBuilder<SignUpCubit, SignUpState>(
                              builder: (context, state) {
                                if(state is SignUpLoadingState){
                                  return Center(child: CircularProgressIndicator(),);
                                }
                                return InkWell(
                                  onTap: () {
                                    context.read<SignUpCubit>().signUp(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        name: _nameController.text,
                                        phone: _phoneController.text);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have Account?"),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(LoginScreen());
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
