import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_revision_1/ecommerce/login/login_screen.dart';
import 'package:flutter_revision_1/ecommerce/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String image = "assets/images/background1.jpg";
  @override
  void initState() {
    Timer.periodic(
        const Duration(
          seconds: 2,
        ), (timer) {
      if (image == "assets/images/background1.jpg") {
        image = "assets/images/background2.jpg";
      } else {
        image = "assets/images/background1.jpg";
      }
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    /// Responsive Design
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: height,
              child: Image.asset(image,fit: BoxFit.fill)),
          Container(
            color: Colors.black.withOpacity(.2),
          ),
          Positioned(
            top: 120,
            child: Container(
              height: height * .9,
              width: width,
              padding: EdgeInsets.only(bottom: 70,left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to our",style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("E-Grocery",style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      _button(text: "Continue with Email or Phone",
                          color: Colors.green,
                          textColor: Colors.white,
                          width: width,
                          onTap: (){
                            Get.to(
                              LoginScreen(),
                              curve: Curves.bounceInOut,
                              duration: Duration(seconds: 1),
                            );
                        }
                      ),
                      SizedBox(height: 20,),
                      _button(text: "Create an account",
                          color: Colors.white,
                          textColor: Colors.black,
                          width: width,
                        onTap: (){
                          Get.to(SignUpScreen());
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({
    required String text,
    required Color textColor,
    required Color color,
    required double width,
    void Function()? onTap
}) {
    return InkWell(
      onTap: onTap,
      child: Container(
                    height: 60,
                    width: width * .9,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text(text,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                    ),)),
                  ),
    );
  }
}
