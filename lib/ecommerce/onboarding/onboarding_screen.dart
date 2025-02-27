
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/ecommerce/auth/auth_screen.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  String title = "Browse all the category";
  String image = "assets/images/boarding1.jpg";
  String description = "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .";
  int index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(image,fit: BoxFit.fill,)),
              Text(title,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              Text(
                description,
                textAlign:TextAlign.center,
                style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),),
              InkWell(
                onTap: (){
                  _onChangeOnBoarding();
                },
                child: CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  animation: true,
                  percent: index==0? .3 :index==1? .6 :1,
                  center: Icon(CupertinoIcons.arrow_right_circle_fill,color: Colors.green,size: 80,),
                  progressColor: Colors.green,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _onChangeOnBoarding(){
    if(index<2){
      index++;
      title = titleList[index];
      description = descList[index];
      image = "assets/images/boarding${index+1}.jpg";
      setState(() {

      });
    }else{
      Get.to(const AuthScreen(),
          curve: Curves.easeOutBack,duration: Duration(seconds: 1));
    }
  }
}
List titleList = [
  "Browse all the category",
  "Amazing Discounts & Offers",
  "On-demand delivery",
];

List descList = [
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
];
