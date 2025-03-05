import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/widgets/custom_text_field.dart';

class SignUpScreenTask extends StatefulWidget {
  const SignUpScreenTask({super.key});

  @override
  State<SignUpScreenTask> createState() => _SignUpScreenTaskState();
}

class _SignUpScreenTaskState extends State<SignUpScreenTask> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _emailValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        width: width,
        child: Center(
          child: Stack(
            children: [
              Container(
                //can be appBar with centerTitle true and elevation 0
                padding: EdgeInsets.only(top: 100),
                width: double.infinity,
                height: height,
                color: Colors.deepOrange,
                child: Text(
                  textAlign: TextAlign.center,
                  "Your Logo",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  height: height * .75,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        "Create an account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        "Sign Up to continue",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      // CustomTextField(height: height, text: "NAME", controller: _nameController),
                      _buildTextField(text: "NAME"),
                      SizedBox(
                        height: height * .03,
                      ),
                      Form(
                        key: _formKey,
                        child: _buildTextField(
                          text: "EMAIL",
                          onChanged: (value){
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value ?? "");
                            if(emailValid){
                              _emailValid = true;
                            }else{
                              _emailValid = false ;
                            }
                            setState(() {

                            });
                          },
                          validator: (value) {
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value ?? "");
                          // can make the above part as extension for validation
                          if (emailValid == false) {
                            return "Email didn't match";
                          }
                          if (value!.isEmpty) {
                            return "The Field is empty";
                          } else if (value!.length < 11) {
                            return "the numbers in less than 11 digits";
                          }
                          return null;
                        },
                          suffixIcon: _emailValid
                              ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          )
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      CustomTextField(
                        height: height,
                        text: "PASSWORD",
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          _formKey.currentState!.validate();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
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
                          Text("Already Have Account?"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String text,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
