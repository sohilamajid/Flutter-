import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/ecommerce/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 50 , left: 50 , top: 100 , bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/logo3.png")),
                Text(
                  "Welcome to our",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                CustomTextField(height: height ,
                  text: "Email",
                  controller: _emailController,
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? "");
                    if (value!.isEmpty) {
                      return "The Field is empty";
                    }
                    if (emailValid == false) {
                      return "the email is not valid";
                    }
                     else if (value.length < 11) {
                      return "The numbers is less than 11 digits ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * .01,
                ),
                CustomTextField(height: height,
                    text: "Password",
                    controller: _passwordController,
                    isPassword: true),
                SizedBox(
                  height: height * .01,
                ),
                CustomTextField(height: height,
                    text: "Confirm Password",
                    controller: _passwordController2,
                    isPassword: true),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password?"),
                  ],
                ),
                SizedBox(
                  height: height * .04,
                ),
                InkWell(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 10,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?"),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Get.to(SignUpScreen());
                      },
                      child: Text("Sign up",style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required double height,
  //   required String text,
  //   String? Function(String?)? validator,
  //   required TextEditingController controller,
  //   bool? isPassword,
  // }) {
  //   print("is password (1): " + isPassword.toString());
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Text(
  //             text,
  //             style: TextStyle(
  //               fontSize: 14,
  //               color: Colors.grey,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: height * .01,
  //       ),
  //       TextFormField(
  //         controller: controller,
  //         validator: validator,
  //         obscureText: isPassword ?? false,
  //         decoration: InputDecoration(
  //           filled: true,
  //           fillColor: Colors.grey[200],
  //           contentPadding: EdgeInsets.all(12),
  //           border: OutlineInputBorder(borderSide: BorderSide.none),
  //           suffixIcon: isPassword != null
  //               ? InkWell(
  //                   onTap: () {
  //                     isPassword = !isPassword!;
  //                     print("===============isPassword: " +
  //                         isPassword.toString());
  //                     setState(() {});
  //                   },
  //                   child: Icon(isPassword
  //                       ? CupertinoIcons.eye_fill
  //                       : CupertinoIcons.eye_slash_fill),
  //                 )
  //               : null,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
